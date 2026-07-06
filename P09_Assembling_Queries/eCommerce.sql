-- Drop tables if they already exist
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

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
('Jannie', 'Boehm') ,
('Neal', 'Wehner'),
('Mikayla', 'Casper');

-- Insert products
INSERT INTO products (name, department, price, weight)
VALUES
('Shirt', 'Clothing', 876, 3),
('Towels', 'Home', 412, 16),
('Bacon', 'Grocery', 10, 6),
('Ball', 'Sports', 328, 23),
('Fish', 'Grocery', 796, 10),
('Mouse', 'Electronics', 989, 11),
('Computer', 'Electronics', 1298, 2),
('Laptop', 'Electronics', 5500, 4),
('Keyboard', 'Electronics', 750, 2),
('Monitor', 'Electronics', 3200, 8),
('Chair', 'Furniture', 1800, 12),
('Table', 'Furniture', 2500, 20),
('Sofa', 'Furniture', 7200, 40),
('Bottle', 'Kitchen', 250, 1),
('Cup', 'Kitchen', 150, 1),
('Plate', 'Kitchen', 180, 2),
('Fan', 'Home', 2200, 6),
('Bulb', 'Home', 120, 1),
('Bed', 'Furniture', 9500, 55),
('Pillow', 'Home', 450, 2),
('Blanket', 'Home', 900, 5),
('Notebook', 'Stationery', 80, 1),
('Pen', 'Stationery', 20, 1),
('Pencil', 'Stationery', 10, 1),
('Eraser', 'Stationery', 5, 1),
('Bag', 'Accessories', 1100, 3),
('Shoes', 'Footwear', 2400, 4),
('Watch', 'Accessories', 4800, 1),
('Phone', 'Electronics', 18000, 1),
('Headphones', 'Electronics', 1600, 1),
('Speaker', 'Electronics', 2800, 5),
('Camera', 'Electronics', 25000, 3),
('Printer', 'Electronics', 8500, 10),
('Book', 'Books', 350, 2),
('Novel', 'Books', 500, 2),
('Dictionary', 'Books', 950, 4),
('Toy Car', 'Toys', 300, 2),
('Doll', 'Toys', 650, 3),
('Puzzle', 'Toys', 400, 2),
('Cricket Bat', 'Sports', 1500, 6),
('Football', 'Sports', 900, 5),
('Tennis Racket', 'Sports', 2100, 4),
('Helmet', 'Sports', 1700, 3),
('Drill Machine', 'Tools', 4200, 9),
('Hammer', 'Tools', 350, 3),
('Screwdriver', 'Tools', 220, 1),
('Wrench', 'Tools', 450, 2),
('Paint Bucket', 'Industrial', 1300, 18),
('Ladder', 'Industrial', 3400, 25),
('Generator', 'Industrial', 22000, 80);

-- Insert orders
INSERT INTO orders (user_id, product_id, paid) VALUES
(5, 4, TRUE),
(3, 2, TRUE),
(4, 6, FALSE),
(5, 3, TRUE),
(1, 1, FALSE);

-- Products whose price is greater than the most expensive toy
SELECT name, price
FROM products
WHERE price > (
    SELECT MAX(price)
    FROM products
    WHERE department = 'Toys'
);

-- Many rows, many columns
SELECT *
FROM products;

-- Many rows, one column
SELECT id
FROM products;

-- One row, one column
SELECT COUNT(*)
FROM products;

-- Show each product with the maximum product price
SELECT
    name,
    price,
    (
        SELECT MAX(price)
        FROM products
    ) AS max_price
FROM products
WHERE price > 867;

-- Show each product with the price of product having id = 3
SELECT
    name,
    price,
    (
        SELECT price
        FROM products
        WHERE id = 3
    ) AS id_3_price
FROM products
WHERE price > 867;

-- Price-to-weight ratio (decimal)
SELECT
    name,
    price::numeric / weight AS price_weight_ratio
FROM products;


SELECT AVG(order_count) FROM (
    SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id
) AS p


SELECT id 
FROM orders 
WHERE product_id IN (
    SELECT id FROM products WHERE price/weight > 50
);

-- 
SELECT name
FROM products
WHERE Price > (
    SELECT AVG(price) FROM products
);

-- NOT IN
SELECT name, department
FROM products
WHERE department NOT IN (
    SELECT department
    FROM products
    WHERE price < 100
);

-- Show the name, department, and price of products that are more expensive than all products in the 'Industrial' department
SELECT name, department, price FROM products WHERE price > ALL(
    SELECT price FROM products WHERE department = 'Industrial'
);

-- Show the name of the products that are more expensive than atleast one product in the 'Industrial' department
SELECT name, department, price FROM products WHERE price > SOME(
    SELECT price FROM products WHERE department = 'Industrial'
);