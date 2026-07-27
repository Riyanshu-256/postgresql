-- Users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Posts
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    caption VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Likes
CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- Users Data
INSERT INTO users (username, email) VALUES
('john','john@gmail.com'),
('alice','alice@gmail.com'),
('bob','bob@gmail.com'),
('charlie','charlie@gmail.com'),
('david','david@gmail.com'),
('emma','emma@gmail.com'),
('sam','sam@gmail.com'),
('alex','alex@gmail.com'),
('mike','mike@gmail.com'),
('sara','sara@gmail.com');

-- Posts Data
INSERT INTO posts (user_id, caption) VALUES
(1,'Learning SQL'),
(1,'My Second Post'),
(2,'Hello World'),
(3,'Database Practice'),
(4,'CTE Example'),
(5,'Learning JOIN'),
(6,'PostgreSQL'),
(7,'Node.js'),
(8,'React App'),
(9,'Final Project'),
(10,'Thank You');

-- Likes Data
INSERT INTO likes (user_id, post_id) VALUES
(1,2),
(2,1),
(3,1),
(4,3),
(5,2),
(6,5),
(7,6),
(8,7),
(9,8),
(10,9);


-- Without CTE (Using Subquery)
SELECT username, tags.created_at
FROM users
JOIN (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

-- With CTE (Cleaner & More Readable)
WITH tags AS (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
)
SELECT DISTINCT users.username, tags.created_at
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';