-- Drop child table first
DROP TABLE IF EXISTS photos;

-- Delete the table if it already exists
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

-- Insert records
INSERT INTO users (username)
VALUES
('Anavya'),
('Aditya'),
('Indu'),
('Anshu'),
('Saloni'),
('Anu'),
('Khushi');

-- Display all records
SELECT * FROM users;