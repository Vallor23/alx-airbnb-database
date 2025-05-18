# 📈 Simple Guide to Monitoring SQL Query Performance

## 🎯 Goal

Keep your database fast by checking how long queries take and making smart changes.

---

## 🔍 Step 1: Check How a Query Runs

### Use EXPLAIN ANALYZE (MySQL 8+)

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = 101 AND status = 'confirmed';
```

### 🛑 Step 2: Look for Problems

Check the output for:
*Full table scan?
*Too many rows read?
*Slow steps?

### 🛠️ Step 3: Improve

Example: Add Index
sql
Copy
Edit
CREATE INDEX idx_user_status ON Booking(user_id, status);
You can also change how your tables are set up if needed.

### ✅ Step 4: Test Again

Run the same query again using EXPLAIN ANALYZE or SHOW PROFILE.

Compare the before and after.

### 📊 Compare Results

Check Before After
Rows read  
Time taken  
Extra steps

### 📌 Reminder

Keep checking your most used queries every now and then. Small changes can make a big difference!