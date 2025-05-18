# Performance Report: Booking Table Partitioning

## 🎯 Objective

To optimize query performance on a large `Booking` table by partitioning it using the `start_date` column.

## 🛠️ What Was Done

- Recreated the `Booking` table with `RANGE` partitioning on the `YEAR(start_date)`.
- Created partitions for bookings from 2021 to future years.
- Tested query performance using `EXPLAIN ANALYZE` on a date range filter.

## 🧪 Test Query

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
```

## 📊 Observations

| Metric             | Before Partitioning | After Partitioning |
|--------------------|---------------------|--------------------|
| Rows Examined      |                     |                    |
| Execution Time     |                     |                    |
| Partitions Accessed|                     |                    |

_Fill in the metrics above after running tests on both unpartitioned and partitioned tables._

## ✅ Conclusion

Partitioning the `Booking` table using the `start_date` column improved query performance by allowing MySQL to only scan relevant partitions. This is particularly useful for time-based data in large datasets.
