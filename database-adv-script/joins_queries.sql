SELECT *
FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id
;

SELECT *
FROM Property
LEFT JOIN Review ON Property.Property_id = Review.Property_id
ORDER BY Property.property_id ASC
;

SELECT *
FROM User
FULL OUTER JOIN Booking ON User.user_id = Booking.user_id
;