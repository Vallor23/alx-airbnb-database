# ERD Requirements for ALX Airbnb Database

This document outlines the database requirements, entities, relationships, and assumptions made for designing the ER diagram for the Airbnb-like database system.

## Entities and Attributes

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

-review_id: Primary Key, UUID, Indexed
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

## Constraints

### User Table

* Unique constraint on email.
* Non-null constraints on required fields.

### Property Table

* Foreign key constraint on host_id.
* Non-null constraints on essential attributes.

### Booking Table

* Foreign key constraints on property_id and user_id.
* status must be one of pending, confirmed, or canceled.

### Payment Table

* Foreign key constraint on booking_id, ensuring payment is linked to valid bookings.

### Review Table

* Constraints on rating values (1-5).
* Foreign key constraints on property_id and user_id.

### Message Table

* Foreign key constraints on sender_id and recipient_id.

## Relationships

1. **User - Booking**
    * A user can make many bookings → One-to-Many
    * Booking belongs to one user

2. **Property - Booking**
    * A property can have many bookings → One-to-Many
    * A booking refers to one property

3. **User - Property**
    * A user can own many properties → One-to-Many
    * A property is owned by one user

4. **Payment - Booking** 
    * A booking has one corresponding payment  → One-to-One
    * A payment is linked to one booking

5. **User and Review**
    * A user can write reviews for for different properties → One-to-Many
    * A review is written by one user

6. **Property and Review**
    * Many different users can leave reviews for a single property → One-to-Many
    * A review belongs to one property

7. **User and Message**
    * User can send many Messages → One-to-Many
    * User can also receive many Messages → One-to-Many