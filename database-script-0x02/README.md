# Airbnb Clone — Seed Data

This file explains the **sample data** used to populate the database.
The goal is to have **realist examples** that will help us test how the app will work with actual data.

---

## 🧑 User

We are adding two users, one host and two guest.

```sql
INSERT INTO User(first_name, last_name, email, password_hash, Phone_number, role)
VALUES 
('Alice', 'Smith', 'alice@example.com', 'hashed_1', '+254712345678', 'user'),
('John', 'Kamau', 'john@example.com', 'hashed_2', '+254798765432', 'host'),
('Mary', 'Otieno', 'mary@example.com', 'hashed_3', '+254700112233', 'user');
```

## 🏠 Property

**John (the host)** lists two properties — one in Mombasa and one in Nairobi.

```sql
INSERT INTO Property(host_id, name, description, location, pricepernight)
VALUES 
(2, 'Cozy Apartment near the Beach', 'A lovely Nyali retreat', 'Mombasa', 150.00),
(2, 'Modern Studio in Westlands', 'Perfect for business travelers', 'Nairobi', 180.00);
```

## 📅 Booking

Two bookings made by **Alice** and **Mary**

```sql
INSERT INTO Property(host_id, name, description, location, pricepernight)
VALUES 
(2, 'Cozy Apartment near the Beach', 'A lovely Nyali retreat', 'Mombasa', 150.00),
(2, 'Modern Studio in Westlands', 'Perfect for business travelers', 'Nairobi', 180.00);
```

## 💰 Payment

Payments made for the above bookings

```sql
INSERT INTO Payment(booking_id, amount, payment_method)
VALUES 
(1, 750.00, 'mpesa'),
(2, 360.00, 'credit_card');
```

## ⭐ Review

Guest review their stays.

```sql
INSERT INTO Review(user_id, property_id, rating, comment)
VALUES 
(1, 1, 5, 'Amazing stay! Loved the ocean breeze.'),
(3, 2, 4, 'Clean and convenient, but noisy at night.');
```

## 💬 Message

Basic conversation between **Alice** and **John**.

```sql
INSERT INTO Message(sender_id, receiver_id, message_body)
VALUES 
(1, 2, 'Hi, is the Nairobi studio available in August?'),
(2, 1, 'Yes! Feel free to book it any time.');
```
