# 放些不知道塞哪的東西

## 確保不會有 utf8 問題
```mysql
set global CHARACTER_SET_RESULTS    = 'utf8mb4';
set global CHARACTER_SET_CONNECTION = 'utf8mb4';
set global CHARACTER_SET_CLIENT     = 'utf8mb4';
set global CHARACTER_SET_SERVER     = 'utf8mb4';
set global COLLATION_CONNECTION     = 'utf8mb4_general_ci';
set global COLLATION_DATABASE       = 'utf8mb4_general_ci';
set global COLLATION_SERVER         = 'utf8mb4_general_ci';
set global CHARACTER_SET_DATABASE   = 'utf8mb4';
```
