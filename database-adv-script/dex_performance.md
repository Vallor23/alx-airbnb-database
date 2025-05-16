
# 📊 Index Performance Improvement - MySQL README

## 📝 Overview

This document demonstrates how **MySQL indexes** improve query performance.  
We compare query execution time **before and after adding indexes** using `EXPLAIN` and `ANALYZE`.

## 🚀 Objective

- Optimize query speed on large tables.
- Use indexes to avoid full table scans.
- Show impact of **single** and **composite indexes** in MySQL.

## 🗄️ Tables & Columns Indexed

| Table     | Column(s) Indexed                   | Index Type      |
|-----------|-------------------------------------|-----------------|
| Booking   | `user_id`, `status`, `booking_id`   | Single-column   |
| Booking   | `(user_id, property_id)`            | Composite index |
| Property  | `user_id`                           | Single-column   |
| Review    | `user_id`                           | Single-column   |
| Rating    | `user_id`                           | Single-column   |
| Rating    | `(user_id, property_id)`            | Composite index |
| User      | `registration_date`                 | Single-column   |

## 🧪 Performance Testing

### 1️⃣ Check Query Performance (Before Index)

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE booking_id = 124;
```

- Likely to show **ALL → Full Table Scan** in `EXPLAIN`.
- High rows examined → slow performance.

### 2️⃣ Create Index

```sql
CREATE INDEX idx_booking_id ON Booking(booking_id);
```

### 3️⃣ Check Query Performance (After Index)

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE booking_id = 124;
```

- Should now use **ref** or **const** type index access.
- Rows examined reduced to 1 (ideal).

## 📈 Sample Result Table

| Test                | Rows Examined | Access Type | Execution Time |
|---------------------|---------------|-------------|----------------|
| Before Indexing     | 10000+        | ALL (Full Scan) | ~500ms      |
| After Indexing      | 1             | ref / const | ~10ms         |

## 🔎 Why Indexing Helps

- Indexes prevent **full table scans** for large datasets.
- Speeds up lookups, joins, and filters.
- Composite indexes are efficient for **multi-column WHERE conditions**.

## ✅ Conclusion

- Always test with `EXPLAIN` and `ANALYZE` in MySQL.
- Index frequently queried columns.
- Composite indexes boost performance for multi-column searches.
- Balance between **read speed** and **write overhead**.

## 📚 MySQL Resources

- [MySQL EXPLAIN Statement](https://dev.mysql.com/doc/refman/8.0/en/explain.html)
- [MySQL ANALYZE Statement](https://dev.mysql.com/doc/refman/8.0/en/analyze-table.html)
- [MySQL Index Optimization Guide](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html)

## ✅ Bonus Tip

In MySQL, composite indexes matter **when WHERE uses multiple columns** in left-to-right order:

```sql
-- This uses composite index
SELECT * FROM Booking WHERE user_id = 5 AND property_id = 10;
```

But this **won’t**:

```sql
SELECT * FROM Booking WHERE property_id = 10;
```

> Composite indexes follow the "leftmost prefix" rule.