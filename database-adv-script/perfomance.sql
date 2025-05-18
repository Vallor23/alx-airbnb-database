EXPLAIN SELECT * FROM   Booking b JOIN User u ON b.user_id = u.user_id;

EXPLAIN SELECT * FROM Booking WHERE(booking_id=2 AND property_id= 1) ;

EXPLAIN SELECT * FROM Booking JOIN Payment  ON Booking.booking_id = Payment.booking_id;

EXPLAIN  SELECT * FROM Booking ORDER BY start_date DESC;

CREATE INDEX idx_user_id ON Booking(user_id);

CREATE INDEX idx_booking_property_id ON Booking(property_id);

CREATE INDEX idx_booking_start_date ON Booking(start_date DESC);
