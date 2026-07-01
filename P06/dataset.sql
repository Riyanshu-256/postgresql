-- Delete old tables
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(56),
    last_name VARCHAR(56)
);

-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    price INT,
    weight INT
);

-- Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    product_id INT REFERENCES products(id),
    paid BOOLEAN
);

-- Insert users
INSERT INTO users (first_name, last_name) VALUES
('Iva', 'Lindgren'),
('Ignatius', 'Johns'),
('Jannie', 'Boehm'),
('Neal', 'Wehner'),
('Mikayla', 'Casper');

-- Insert products
INSERT INTO products (name, department, price, weight) VALUES
('Shirt', 'Toys', 876, 3),
('Towels', 'Outdoors', 412, 16),
('Bacon', 'Movies', 10, 6),
('Ball', 'Industrial', 328, 23),
('Fish', 'Tools', 796, 10),
('Mouse', 'Grocery', 989, 11),
('Computer', 'Home', 298, 2);

-- Insert orders
INSERT INTO orders (user_id, product_id, paid) VALUES
(5, 4, TRUE),
(3, 2, TRUE),
(4, 6, FALSE),
(5, 3, TRUE),
(1, 1, FALSE);

-- Show all tables
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;

-- Count paid/unpaid orders
SELECT paid, COUNT(*)
FROM orders
GROUP BY paid;

-- Join users and orders
SELECT
    first_name,
    last_name,
    paid
FROM users
JOIN orders
ON users.id = orders.user_id;
