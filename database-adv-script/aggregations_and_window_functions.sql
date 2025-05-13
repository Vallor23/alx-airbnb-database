SELECT u.first_name,u.user_id, COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON b.user_id = u.user_id
GROUP BY u.user_id;

WITH bookingCount AS (
    SELECT p.property_id,p.property_name, COUNT(b.booking_id) AS total_bookings
    FROM Property P
    LEFT JOIN Booking b ON b.property_id = p.property_id
    GROUP BY b.property_id)

SELECT p.property_id,
    p.property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number
FROM bookingCount;