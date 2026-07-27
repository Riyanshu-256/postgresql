
-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Posts Table
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    caption VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Likes Table
CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- Insert 50 Users
INSERT INTO users (username, email) VALUES
('user1','user1@gmail.com'),
('user2','user2@gmail.com'),
('user3','user3@gmail.com'),
('user4','user4@gmail.com'),
('user5','user5@gmail.com'),
('user6','user6@gmail.com'),
('user7','user7@gmail.com'),
('user8','user8@gmail.com'),
('user9','user9@gmail.com'),
('user10','user10@gmail.com'),
('user11','user11@gmail.com'),
('user12','user12@gmail.com'),
('user13','user13@gmail.com'),
('user14','user14@gmail.com'),
('user15','user15@gmail.com'),
('user16','user16@gmail.com'),
('user17','user17@gmail.com'),
('user18','user18@gmail.com'),
('user19','user19@gmail.com'),
('user20','user20@gmail.com'),
('user21','user21@gmail.com'),
('user22','user22@gmail.com'),
('user23','user23@gmail.com'),
('user24','user24@gmail.com'),
('user25','user25@gmail.com'),
('user26','user26@gmail.com'),
('user27','user27@gmail.com'),
('user28','user28@gmail.com'),
('user29','user29@gmail.com'),
('user30','user30@gmail.com'),
('user31','user31@gmail.com'),
('user32','user32@gmail.com'),
('user33','user33@gmail.com'),
('user34','user34@gmail.com'),
('user35','user35@gmail.com'),
('user36','user36@gmail.com'),
('user37','user37@gmail.com'),
('user38','user38@gmail.com'),
('user39','user39@gmail.com'),
('user40','user40@gmail.com'),
('user41','user41@gmail.com'),
('user42','user42@gmail.com'),
('user43','user43@gmail.com'),
('user44','user44@gmail.com'),
('user45','user45@gmail.com'),
('user46','user46@gmail.com'),
('user47','user47@gmail.com'),
('user48','user48@gmail.com'),
('user49','user49@gmail.com'),
('user50','user50@gmail.com');


-- INSERT POSTS (100 POSTS)
INSERT INTO posts (user_id, caption) VALUES
(1,'Post by user1'),
(2,'Post by user2'),
(3,'Post by user3'),
(4,'Post by user4'),
(5,'Post by user5'),
(6,'Post by user6'),
(7,'Post by user7'),
(8,'Post by user8'),
(9,'Post by user9'),
(10,'Post by user10'),
(11,'Post by user11'),
(12,'Post by user12'),
(13,'Post by user13'),
(14,'Post by user14'),
(15,'Post by user15'),
(16,'Post by user16'),
(17,'Post by user17'),
(18,'Post by user18'),
(19,'Post by user19'),
(20,'Post by user20'),
(21,'Post by user21'),
(22,'Post by user22'),
(23,'Post by user23'),
(24,'Post by user24'),
(25,'Post by user25'),
(26,'Post by user26'),
(27,'Post by user27'),
(28,'Post by user28'),
(29,'Post by user29'),
(30,'Post by user30'),
(31,'Another post by user31'),
(32,'Another post by user32'),
(33,'Another post by user33'),
(34,'Another post by user34'),
(35,'Another post by user35'),
(36,'Another post by user36'),
(37,'Another post by user37'),
(38,'Another post by user38'),
(39,'Another post by user39'),
(40,'Another post by user40'),
(41,'Another post by user41'),
(42,'Another post by user42'),
(43,'Another post by user43'),
(44,'Another post by user44'),
(45,'Another post by user45'),
(46,'Another post by user46'),
(47,'Another post by user47'),
(48,'Another post by user48'),
(49,'Another post by user49'),
(50,'Another post by user50'),
(1,'Learning SQL'),
(2,'Learning MySQL'),
(3,'Database Practice'),
(4,'Hello World'),
(5,'My Second Post'),
(6,'Working with Joins'),
(7,'SQL is fun'),
(8,'Backend Development'),
(9,'Coding Time'),
(10,'Database Design'),
(11,'Sample Post'),
(12,'Practice Makes Perfect'),
(13,'Good Morning'),
(14,'Good Evening'),
(15,'Weekend Coding'),
(16,'Tech News'),
(17,'Programming'),
(18,'Learning PHP'),
(19,'Learning Python'),
(20,'Learning Java'),
(21,'Node.js Rocks'),
(22,'Laravel Project'),
(23,'Express API'),
(24,'React App'),
(25,'Vue Project'),
(26,'Angular Demo'),
(27,'Spring Boot'),
(28,'Docker Basics'),
(29,'GitHub Commit'),
(30,'Clean Code'),
(31,'Algorithms'),
(32,'Data Structures'),
(33,'REST API'),
(34,'CRUD Operations'),
(35,'Authentication'),
(36,'Authorization'),
(37,'JWT Login'),
(38,'Debugging'),
(39,'Performance'),
(40,'Optimization'),
(41,'Deployment'),
(42,'Cloud Computing'),
(43,'AWS Learning'),
(44,'Azure Practice'),
(45,'GCP Basics'),
(46,'MongoDB'),
(47,'Redis Cache'),
(48,'Linux Commands'),
(49,'Final Project'),
(50,'Thank You');

-- INSERT LIKES
INSERT INTO likes (user_id, post_id) VALUES
(1,2),(2,3),(3,4),(4,5),(5,6),
(6,7),(7,8),(8,9),(9,10),(10,11),
(11,12),(12,13),(13,14),(14,15),(15,16),
(16,17),(17,18),(18,19),(19,20),(20,21),
(21,22),(22,23),(23,24),(24,25),(25,26),
(26,27),(27,28),(28,29),(29,30),(30,31),
(31,32),(32,33),(33,34),(34,35),(35,36),
(36,37),(37,38),(38,39),(39,40),(40,41),
(41,42),(42,43),(43,44),(44,45),(45,46),
(46,47),(47,48),(48,49),(49,50),(50,1);

-- ==========================================
-- SAMPLE QUERIES
-- ==========================================

-- Last 3 users
SELECT * FROM users
ORDER BY id DESC
LIMIT 3;

-- All posts of user 20
SELECT *
FROM users
JOIN posts ON posts.user_id = users.id
WHERE posts.user_id = 20;

-- Username and caption
SELECT users.username, posts.caption
FROM users
JOIN posts ON posts.user_id = users.id
WHERE posts.user_id = 20;

-- Count likes made by each user
SELECT users.username, COUNT(*) AS total_likes
FROM users
JOIN likes ON likes.user_id = users.id
GROUP BY users.id, users.username
ORDER BY total_likes DESC;