---
highlightTheme: zenburn
---

# SQL Injection

---

## 這啥

--

一種故意塞奇怪的內容讓別人的程式講錯話的手法

--

好比說你要登入

你輸入了 帳號: admin 密碼: meow

假設拼出來的 SQL 指令長這樣

```sql
SELECT * from Users
  where username = 'admin' and password = md5('meow');
```

--

字串是用單引號包的呢

那在參數裡加個 `'` 好了

帳號: `admin'` 密碼: meow

```sql
SELECT * from Users
  where username = 'admin'' and password = md5('meow');
```

--

上色爆炸啦

這行拿去跑會噴錯誤

