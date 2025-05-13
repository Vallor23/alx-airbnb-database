# Complex SQL Queries using JOINs

This project demonstrates how to write SQL queries using different types of JOINs to combine data from related tables.

## SQL Queries

### 1️⃣ INNER JOIN — Bookings with User Information

```sql
SELECT * 
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id;
```

-Returns records where Booking and User tables have matching user_id

### 2️⃣ LEFT JOIN — Properties and their Reviews

```sql
SELECT *
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;
```

* Returns all properties.
* Shows matching reviews if available.
* Returns NULL for properties without reviews.

### 3️⃣ FULL OUTER JOIN — All Users and Bookings

```sql
SELECT *
FROM User
FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;
```

* Returns all users and all bookings.
* Shows matching records.
* Non-matching entries are filled with NULL.

## ✅ Summary of JOIN Types

| JOIN Type           | Description                                      |
| ------------------- | ------------------------------------------------ |
| **INNER JOIN**      | Only matching records from both tables           |
| **LEFT JOIN**       | All records from the left table + matching right(NULL if no match) |
| **FULL OUTER JOIN** | All records from both tables (NULL if no match)  |
