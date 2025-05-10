# ✅ Normalized ALX Airbnb Database

This document outlines the normalized design of a Airbnb-like database system, listing entities, attributes, and relationships in line with best practices.

## 🔸 Entities and Attributes

### 1. User

-`user_id` (Primary key)
-`name`
-`email`
-`password`
-`phone_number`
-`role`(to distinguish between host and user)
-`created_at`

### 2. Property

-`property_id`: Primary Key, UUID, Indexed
-`host_id`: Foreign Key, references User(user_id)
-`name`: VARCHAR, NOT NULL
-`description`: TEXT, NOT NULL
-`location`: VARCHAR, NOT NULL
-`pricepernight`: DECIMAL, NOT NULL
-`created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
-`updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. Booking

-`booking_id` (Primary key)
-`property_id` (Foreign Key, references Property(property_id))
-`user_id` ( Foreign Key, references User(user_id))
-`start_date`: DATE, NOT NULL
-`end_date`: DATE, NOT NULL
-`status`: ENUM (pending, confirmed, canceled), NOT NULL
-`total_price`: DECIMAL, NOT NULL

### 3. payment

-`payment_id`: Primary Key, UUID, Indexed
-`booking_id`: Foreign Key, references Booking(booking_id)
-`amount`: DECIMAL, NOT NULL
-`payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
-`payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### 3. reviews

-`review_id`: Primary Key, UUID, Indexed
-`property_id`: Foreign Key, references Property(property_id)
-`user_id`: Foreign Key, references User(user_id)
-`rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
-`comment`: TEXT, NOT NULL
-`created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 5. messages

-`message_id`: Primary Key, UUID, Indexed
-`sender_id`: Foreign Key, references User(user_id)
-`recipient_id`: Foreign Key, references User(user_id)
-`message_body`: TEXT, NOT NULL
-`sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## ✅ Notes on Normalization

    * All repeating groups have been eliminated(1NF)
    * Partial dependencies have been eliminated hence non key attributes depends on the entire composite key(2NF)
    * Non key attributes depend only on primary keys, not another non key attribute(3NF)
    * All determinants are candidate keys — the schema also satisfies Boyce-Codd Normal Form (BCNF).
    