-- Drop table if it already exists
DROP TABLE IF EXISTS products;

-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    price INT,
    weight INT
);

-- Insert records
INSERT INTO products (name, department, price, weight)
VALUES
('Shirt', 'Toys', 876, 3),
('Towels', 'Outdoors', 412, 16),
('Bacon', 'Movies', 10, 6),
('Ball', 'Industrial', 328, 23),
('Fish', 'Tools', 796, 10),
('Mouse', 'Grocery', 989, 11),
('Computer', 'Home', 298, 2);

-- Display all records in ascending order
SELECT * FROM products ORDER BY price;

-- Display all records in descending order
SELECT * FROM products ORDER BY price DESC;

-- Display all records in sorted alphabets A -> Z order
SELECT * FROM products ORDER BY name;

-- Display all records in sorted alphabets Z -> A order
SELECT * FROM products ORDER BY name DESC;

SELECT * FROM products ORDER BY weight;

SELECT COUNT(*) FROM products;

-- Offset n : Skip the 1st nth rows of table
SELECT * FROM products Offset 10;
-- Limit n : Only give the first nth rows of table
SELECT * FROM products LIMIT 5;