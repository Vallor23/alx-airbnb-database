SELECT *
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id
;

SELECT *
FROM Property
LEFT JOIN Review ON Property.Property_id = Review.Property_id
;

SELECT *
FROM User
FULL OUTER JOIN Booking
;