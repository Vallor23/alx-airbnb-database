EXPLAIN SELECT * FROM booking b JOIN user u ON b.user_id = u.user_id;

EXPLAIN SELECT * FROM Booking JOIN Property ON Booking.property_id = Property.property_id;

EXPLAIN SELECT * FROM Booking JOIN Payment  ON Booking.booking_id = Payment.booking_id;
