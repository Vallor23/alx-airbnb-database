
# 🧠 SQL Query Optimization Report

This report reviews several SQL queries using `EXPLAIN` and outlines optimizations using indexing to improve performance.

---

## 🔍 Query 1: Join `Booking` and `User`

```sql
EXPLAIN SELECT * FROM Booking b JOIN User u ON b.user_id = u.user_id;
```

**Insight:** If `user_id` is not indexed in `Booking`, the join may result in a full table scan.

**Optimization:**

```sql
CREATE INDEX idx_user_id ON Booking(user_id);
```

---

## 🔍 Query 2: Filter by `booking_id` and `property_id`

```sql
EXPLAIN SELECT * FROM Booking WHERE booking_id = 2 AND property_id = 1;
```

**Insight:** Without indexes, this will result in a full table scan.

**Optimization:**

```sql
CREATE INDEX idx_booking_property_id ON Booking(property_id);
```

> For best performance, a composite index on both columns may help if this exact query is frequent.

---

## 🔍 Query 3: Join `Booking` and `Payment`

```sql
EXPLAIN SELECT * FROM Booking JOIN Payment ON Booking.booking_id = Payment.booking_id;
```

**Insight:** If `booking_id` is not indexed in both tables, join performance will degrade.

**Recommendation:** Ensure `booking_id` is indexed in both `Booking` and `Payment` tables.

---

## 🔍 Query 4: Sort Bookings by Start Date

```sql
EXPLAIN SELECT * FROM Booking ORDER BY start_date DESC;
```

**Insight:** Sorting without index leads to filesort, which is expensive.

**Optimization:**

```sql
CREATE INDEX idx_booking_start_date ON Booking(start_date DESC);
```

---

## 📈 Summary of Indexes Created

```sql
CREATE INDEX idx_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date DESC);
```

These indexes reduce full table scans and filesort operations, and improve join and filter performance.

---

## ✅ Final Notes

- Always test performance using `EXPLAIN` or `ANALYZE` before and after applying indexes.
- Use composite indexes when filtering by multiple columns together.
- Indexes speed up reads but slow down writes slightly — balance based on use case.
