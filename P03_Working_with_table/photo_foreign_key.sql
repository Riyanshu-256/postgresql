DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(50),
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO photos (url, user_id)
VALUES
('http://three.jpg', 3),
('http://four.jpg', 4),
('http://five.jpg', 4),
('http://six.jpg', 6),
('http://seven.jpg', 7);

-- Try to insert a photo with an invalid user_id -> give foreign error
-- INSERT INTO photos (url, user_id)
-- VALUES ('http://random.jpg', 999);

-- Try to insert a photo without assigning a user
-- INSERT INTO photos (url, user_id)
-- VALUES ('http://random.jpg', NULL);


SELECT * FROM photos;

-- Delete user with ID 4
DELETE FROM users WHERE id = 4;

-- Show photos of user with ID 4
-- SELECT * FROM photos WHERE user_id = 4;

-- SELECT url, username FROM photos JOIN users ON users.id = photos.user_id;


-- Display users
SELECT * FROM users;