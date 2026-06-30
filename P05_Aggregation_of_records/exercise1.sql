-- Create authors table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(56)
);

-- Create books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author_id INTEGER REFERENCES authors(id)
);

-- Insert authors
INSERT INTO authors (name)
VALUES
('JK Rowling'),
('Stephen King'),
('Agatha Christie'),
('Dr Seuss');

-- Insert books
INSERT INTO books (title, author_id)
VALUES
('Chamber of Secrets', 1),
('Prisoner of Azkaban', 1),
('The Dark Tower', 2),
('Wonder At the Links', 3),
('Affair at Styles', 3),
('Cat in the Hat', 4);

-- Count books written by each author
SELECT author_id, COUNT(*)
FROM books
GROUP BY author_id;

-- Count books written by each author
SELECT name, COUNT(*)
FROM books
JOIN authors
ON books.author_id = authors.id
GROUP BY authors.name;
