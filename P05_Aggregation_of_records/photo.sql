-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

-- Create photos table
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(100),
    user_id INTEGER REFERENCES users(id)
);

-- Create comments table
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    contents VARCHAR(250),
    user_id INTEGER REFERENCES users(id),
    photo_id INTEGER REFERENCES photos(id)
);

-- Insert users (15 users)
INSERT INTO users (username)
VALUES
('Ishita_Kapoor'),
('Aryan_Singh'),
('Neha_Gupta'),
('Dev_Patel'),
('Ananya_Roy'),
('Rahul_Yadav'),
('Simran_Kaur'),
('Vivek_Agarwal'),
('Pooja_Mishra'),
('Harsh_Malhotra'),
('Aarav_01'),
('Priya_Sharma'),
('Rohan_Verma'),
('Sneha_Jain'),
('Karan_Mehta'),
('Karan_Mehta');

-- Insert photos (25 photos)
INSERT INTO photos (url, user_id)
VALUES
('https://travel11.com', 6),
('https://nature12.com', 7),
('https://food13.com', 8),
('https://tech14.com', 9),
('https://fitness15.com', 10),
('https://cars16.com', 11),
('https://mountains17.com', 12),
('https://beach18.com', 13),
('https://city19.com', 14),
('https://flowers20.com', 15),
('https://sunset21.com', 6),
('https://forest22.com', 8),
('https://coffee23.com', 10),
('https://coding24.com', 12),
('https://wildlife25.com', 15),
('https://lake26.com', 1),
('https://river27.com', 2),
('https://snow28.com', 3),
('https://garden29.com', 4),
('https://sky30.com', 5),
('https://desert31.com', 6),
('https://night32.com', 7),
('https://rain33.com', 8),
('https://village34.com', 9),
('https://bridge35.com', 10);

-- Insert comments
INSERT INTO comments (contents, user_id, photo_id)
VALUES
('What a fantastic photo!', 6, 2),
('Absolutely loved this!', 7, 5),
('Very inspiring.', 8, 7),
('Looks amazing!', 9, 10),
('Such a beautiful shot.', 10, 12),
('Keep up the great work.', 11, 14),
('This is stunning.', 12, 16),
('Perfect composition.', 13, 18),
('Awesome picture!', 14, 20),
('Really impressive.', 15, 21),
('Colors are vibrant.', 6, 23),
('Excellent capture.', 7, 24),
('I like this one.', 8, 25),
('So creative!', 9, 15),
('Wonderful scenery.', 10, 11),
('Brilliant work.', 11, 13),
('Loved every detail.', 12, 17),
('This deserves more likes.', 13, 19),
('Fantastic editing.', 14, 22),
('Truly breathtaking.', 15, 5),
('One of my favorites.', 6, 8),
('Very well clicked.', 7, 3),
('Outstanding effort.', 8, 6),
('Looks professional.', 9, 9),
('Simply beautiful.', 10, 4),
('Amazing lighting.', 11, 2),
('Great perspective.', 12, 18),
('So relaxing to watch.', 13, 14),
('Excellent timing.', 14, 12),
('Really cool picture.', 15, 16),
('Nature at its best.', 6, 20),
('This made my day.', 7, 21),
('Love the background.', 8, 24),
('Fantastic angle.', 9, 25),
('You have talent!', 10, 23),
('Wonderful colors.', 11, 19),
('Very eye-catching.', 12, 17),
('Picture perfect.', 13, 13),
('So elegant.', 14, 7),
('Great click!', 15, 6),
('Absolutely gorgeous.', 6, 1),
('Really unique shot.', 7, 5),
('Excellent framing.', 8, 9),
('Beautiful location.', 9, 10),
('Love this capture.', 10, 15),
('Fantastic view.', 11, 18),
('Keep posting more!', 12, 22),
('So peaceful.', 13, 24),
('Great composition.', 14, 25),
('Masterpiece!', 15, 20);

-- Aggregate Functions
SELECT MAX(id) FROM comments;
SELECT  MIN(id) FROM comments;
SELECT AVG(id) FROM comments;
SELECT SUM(photo_id) FROM comments;
SELECT COUNT(user_id) FROM comments;

-- GROUP BY
SELECT user_id FROM comments GROUP BY user_id;
SELECT user_id, MAX(id) FROM comments GROUP BY user_id;
SELECT user_id, COUNT(id) FROM comments GROUP BY user_id;

SELECT * FROM photos;
SELECT COUNT(user_id) FROM photos;

-- Count comments for each user
SELECT user_id, COUNT(*) FROM comments GROUP BY user_id;

-- Count comments for each photo
SELECT photo_id, COUNT(*) FROM comments GROUP BY photo_id;

-- Count comments for photos with ID less than 3 and show only those with more than 2 comments
SELECT photo_id, COUNT(*)
FROM comments
WHERE photo_id < 3
GROUP BY photo_id 
HAVING COUNT(*) > 2;

-- Find the users where the users has commented on first 50 photos and the user added more than 20 comments on those photos
SELECT comments.user_id, COUNT(comments.id) AS no_of_comments
FROM comments
WHERE comments.photo_id < 50
GROUP BY comments.user_id
HAVING COUNT(comments.id) > 20;