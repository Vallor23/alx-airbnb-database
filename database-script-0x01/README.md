# Airbnb Clone — Database Schema (MySQL)

This README explains the structure of our MySQL database for the Airbnb-like project.  
It helps you understand **what each table does**, **what fields are included**, and **why they matter**.

## 🔧 What is a Schema?

A schema is the **blueprint of your database** -It defines the kind of data you want to store, how it is structured and how different pieces connect.

---

## 📦 Tables Explained

### 1. 🧑 User

Store all users, both guests and hosts

| Column         | Description                     |
|----------------|---------------------------------|
| user_id        | Unique identifier for the user (Primary Key) |
| first_name     | First name of the user          |
| last_name      | Last name of the user           |
| email          | Unique email for login          |
| password_hash  | Hashed version of user password |
| phone_number   | Contact number  |
| role           | Either `'user'` or `'host'`     |
| created_at     | Time the user was created       |

---

### 2. 🏠 Property

Stores all properties listed by hosts.

| Column         | Description                        |
|----------------|------------------------------------|
| property_id    | Unique identifier (Primary Key)    |
| host_id        | References user who owns property  |
| name           | Title of the property              |
| description    | Detailed info about the property   |
| location       | City or region         |
| pricepernight  | Cost per night                     |
| created_at     | When the property was listed       |
| updated_at     | Last update time                   |

---

### 3. 📅 Booking

Links users to the properties they book.

| Column       | Description                                 |
|--------------|---------------------------------------------|
| booking_id   | Unique booking reference (Primary Key)      |
| user_id      | User making the booking (FK to User)        |
| property_id  | Property being booked (FK to Property)      |
| start_date   | Start of the stay                           |
| end_date     | End of the stay                             |
| total_price  | Final price calculated (nights × rate)      |
| status       | 'pending', 'confirmed', or 'cancelled'      |
| created_at   | Booking creation time                       |

---

### 4. 💰 Payment

Tracks payments made by users.

| Column         | Description                              |
|----------------|------------------------------------------|
| payment_id     | Unique payment ID                        |
| booking_id     | Which booking this payment is for        |
| amount         | How much was paid                        |
| payment_date   | When payment was made                    |
| payment_method | e.g., 'paypal', 'credit_card'             |

---

### 5. ⭐ Review

Stores user reviews about the properties.

| Column       | Description                                 |
|--------------|---------------------------------------------|
| review_id    | Unique ID for the review                    |
| user_id      | Reviewer (FK to User)                       |
| property_id  | Property being reviewed (FK to Property)    |
| rating       | Number from 1 to 5                          |
| comment      | User's comment                              |
| created_at   | Time of the review                          |

---

### 6. 💬 Message

Represents messages exchanged between users.

| Column        | Description                                 |
|---------------|---------------------------------------------|
| message_id    | Unique message ID                           |
| sender_id     | User who sent the message                   |
| receiver_id   | User who received it                        |
| message_body  | Text content                                |
| sent_at       | When the message was sent                   |

---

## ✅ Relationships

- A **host** (User with role 'host') can list many properties.
- A **property** can have many bookings.
- A **booking** belongs to one property and one user.
- A **review** is left by a user about a property.
- Users can **message each other**.

---

## 📌 Notes

- We are using `ENUM` for values like `role`, `status`, and `payment_method`.
- `TIMESTAMP` helps us track when things are created or updated.
