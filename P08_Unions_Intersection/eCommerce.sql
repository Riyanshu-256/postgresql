-- Drop table if it already exists
DROP TABLE IF EXISTS products CASCADE;

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

-- Top 4 most expensive products
(
    SELECT *
    FROM products
    ORDER BY price DESC
    LIMIT 4
)
-- UNION  -> don't contains duplicate
-- UNION ALL -> contains duplicate
-- INTERSECT

-- Display the rows that are present in 1st query but not in 2nd query
EXCEPT

-- Top 4 products by price-to-weight ratio
(
    SELECT *
    FROM products
    ORDER BY price / weight DESC
    LIMIT 4
);