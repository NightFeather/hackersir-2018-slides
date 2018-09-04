# SQL

---

## 啥是 SQL

---

一種用來跟關聯式資料庫(的管理程式)溝通的語言

---

## 關聯式資料庫？

---

就把他當成像 Excel 那樣用一張張的表來存資料

---

這種感覺

<br>

|學號|姓名|
|:--:|:--:|
|D0000000|王小明|
|D1234567|無名氏|

---

# 資料庫基本架構

---

資料庫(database)

裡面可以有好幾張表(table)

表裡面會有一張 n*m 的表格

---

像前面的表格可能就是個名叫 *Students* 的表

然後放在名叫 *FCU* 的資料庫底下

---

# 正題

---

## 基本語法 (一)

---

所以在上面提過的架構裡面

---

我們有 *資料庫*

---

於是就有了這樣的 SQL

- 建立 FCU 這個資料庫
  - ``CREATE DATABASE `FCU`; ``
- 刪掉 FCU 這個資料庫
  - ``DROP DATABASE `FCU`; ``

---

我們有了表

而表是屬於資料庫的

---

這邊可以先下 ` use FCU; `

聲明我要用 `FCU`

---

之後再下

- 建立 Students 這個表
  - ``CREATE TABLE `Students` (stuid VARCHAR(10), name VARCHAR(255));``

- 刪掉 Students 這個表
  - ``DROP TABLE `Students`; ``

---

也可以這樣用

- 在 `FCU` 建立 `Students` 這個表
  - ``CREATE TABLE `FCU`.`Students` (stuid VARCHAR(10), name VARCHAR(255)); ``

- 刪掉 `FCU` 裡的 `Students` 這個表
  - ``DROP TABLE `FCU`.`Students`; ``

---

上一頁要注意引號包的位置

全包一起會被當成一個 table 名稱

資料庫會黑人問號你是要在哪個資料庫操作

---

而且要注意是 `` ` `` 而不是 `'`

`'這會被當成字串'`

`` `這才會被當成資料庫或表或欄位的名稱` ``

---

前面的 create table 是要求建立一個表

表有兩欄分別名為 `stuid` 和 `name`

各自型態是長度上限為 10 和 255 的字串

---

而這邊講的字串是 MySQL/MariaDB 的一種型態
> 意味著不見得每家都支援

---

## 型態

---

### 數字

---

#### 整數

- BIT (1bit)
- TINYINT / BOOL (8bit)
- MEDIUMINT (16bit)
- INT (32bit)
- BIGINT (64bit)

---

#### 帶小數點

- 固定小數點位數
  - DECIMAL/FIXED
- 浮點數
  - FLOAT
  - DOUBLE

---

### 字串

---

#### 建立時指定長度(上限)

- 填滿長度
  - CHAR
    - 補空白
  - BINARY
    - 補 `'\0'`
- 不填滿長度
  - VARCHAR
  - VARBINARY

---

#### 不必指定長度上限的

- 以位元組為單位
  - TINYBLOB ( 255byte)
  - BLOB (~ 64kb)
  - MEDIUMBLOB (~ 16mb)
  - LONGBLOB (~ 4gb)
- 以對應編碼的一個字元為單位
  - TINYTEXT ( 255 chars)
  - TEXT (2^8-1 chars)
  - MEDIUMTEXT ( 2^16-1 chars )
  - LONGTEXT (2^32-1 chars)

---

#### 附註

- CHAR <-> TEXT
  - 差在資料庫內的儲存方式
  - 短的字串存成 VARCHAR 效率會比 TEXT 好一些

---

#### 特殊類型

- ENUM
  - 存的資料是 N 選 1
- SET
  - 存的資料是 N 選 M (不重複)

---

## 基本語法 (二)

---

### 查詢

---

`SELECT * FROM Students;`

倒出 `Students` 這張表裡的所有東西。

---

不過這邊還沒寫任何東西

所以你應該只會得到

`Empty Set`

> 啥都沒有喔

---

### 新增

---

在 `Students` 裡新增一個

學號 **D0000000** 名字是 **喵喵喵** 的人的資料

`INSERT INTO Students (stuid,name) VALUES ( "D0000000", "喵喵喵" );`

---

也可以只有學號

`INSERT INTO Students (stuid) VALUES ("D0000001");`

---

看看現在表裡有啥

---

`SELECT * from Students;`

```
                  +----------+-----------+
                  | stuid    | name      |
                  +----------+-----------+
                  | D0000000 | 喵喵喵     |
                  | D0000001 | NULL      |
                  +----------+-----------+
```

---

### 更新

---

### 替換

---

### 刪除

---
