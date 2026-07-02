-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    price INT,
    weight INT
);

-- Insert 50 records
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

-- Products with price greater than 876
SELECT name, price
FROM products
WHERE price > (
    SELECT MAX(price) FROM products WHERE department = 'Toys'
);

-- Many rows, many column
SELECT * FROM products;

-- Many rows, one column
SELECT id FROM Products;

-- One row, one column
SELECT COUNT(*) FROM products;

SELECT name, price, (
    SELECT MAX(price) FROM products
) FROM products WHERE price > 867;

SELECT name, price, (
    SELECT price FROM products WHERE id = 3
) AS id_3_price
FROM products WHERE price > 867;