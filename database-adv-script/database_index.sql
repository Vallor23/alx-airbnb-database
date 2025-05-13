CREATE INDEX idx_user_id ON Booking(user_id);

CREATE INDEX idx_user_id ON Property(user_id);

CREATE INDEX idx_user_id ON Review(user_id);

CREATE INDEX idx_property_id ON Rating(user_id);

-- composite Index/Multiple columns
CREATE INDEX  idx_user_property ON(Booking(user_id, property_id));

CREATE INDEX  idx_user_property ON(Rating(user_id, property_id));