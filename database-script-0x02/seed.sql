INSERT INTO User( first_name, last_name, email, password_hash, Phone_number, role )
VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'hashed_pwd_1', '+254712345678', 'user'),
('John', 'Kamau', 'john.kamau@example.com', 'hashed_pwd_2', '+254798765432', 'host');

INSERT INTO Property(host_id, name, description, location, pricepernight)
VALUES 
(2, 'Cozy Apartment near the Beach', 'A lovely place for your vacation in Nyali', 'Mombasa', 150.00),
(2, 'Modern Studio in Westlands', 'Perfect for business travelers', 'Nairobi', 180.00);

INSERT INTO Booking(user_id, property_id, start_date, end_date, total_price, status)
VALUES 
(1, 1, '2025-06-10', '2025-06-15', 750.00, 'confirmed'),
(3, 2, '2025-07-01', '2025-07-03', 360.00, 'pending');

INSERT INTO Payment(booking_id, amount, payment_method)
VALUES 
(1, 750.00, 'mpesa'),
(2, 360.00, 'credit_card');

INSERT INTO Review( user_id, property_id, rating, comment)
VALUES
(1, 1, 5, 'Amazing stay! The view of the ocean was beautiful.'),
(3, 2, 4, 'Nice location and clean, but a bit noisy at night.');

INSERT INTO User( user_id, property_id, message_body )
VALUES
(1, 2, 'Hello! Is your apartment available in August?'),
(2, 1, 'Hi Alice, yes it is! Feel free to book anytime.');

