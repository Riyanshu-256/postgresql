-- Drop table if it already exists
DROP TABLE IF EXISTS phones;

-- Create phones table
CREATE TABLE phones (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    manufacturer VARCHAR(100),
    price INT,
    units_sold INT
);

-- Insert records
INSERT INTO phones (name, manufacturer, price, units_sold)
VALUES
('N1280', 'Nokia', 199, 1925),
('iPhone 4', 'Apple', 399, 9436),
('Galaxy S', 'Samsung', 299, 2359),
('S5620 Monte', 'Samsung', 250, 2385),
('N8', 'Nokia', 150, 7543),
('Droid', 'Motorola', 150, 8395),
('Wave S8500', 'Samsung', 175, 9259);

-- Display all records
SELECT * FROM phones;

SELECT name, price, price / (
    SELECT MAX(price) FROM phones
) AS price_ratio
FROM phones;