SELECT u.first_name
FROM User u
WHERE (SELECT COUNT(*) FROM Booking b GROUP BY b.user_id )