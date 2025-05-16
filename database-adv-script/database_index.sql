CREATE INDEX idx_user_id ON Booking(user_id);

CREATE INDEX idx_user_id ON Property(user_id);

CREATE INDEX idx_user_id ON Review(user_id);

CREATE INDEX idx_property_id ON Rating(user_id);

CREATE INDEX idx_user_registration_date ON User(registration_date );

CREATE INDEX idx_booking_status ON Booking(status );

-- composite Index/Multiple columns
CREATE INDEX  idx_user_property ON(Booking(user_id, property_id));

CREATE INDEX  idx_booking_property ON(Rating(user_id, property_id));