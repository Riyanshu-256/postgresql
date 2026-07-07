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

-- Selects the product name, weight, and the larger value between 30 and (2 × weight).
SELECT name, weight, GREATEST(30, 2 * weight) FROM products;

-- Selects the product name, price, and the least value between 0.5 and (2 × price).
SELECT name, price, LEAST(price * 0.5, 400) FROM products;


-- Print each product and its price and description also
SELECT name, price,
CASE
    WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    ELSE 'cheap'
END
FROM products;
