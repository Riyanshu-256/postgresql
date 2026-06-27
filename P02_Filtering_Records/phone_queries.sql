-- Create the phones table
CREATE TABLE phones (
    name VARCHAR(50),
    manufacturer VARCHAR(50),
    price INTEGER,
    units_sold INTEGER
);

-- Insert sample data
INSERT INTO phones (name, manufacturer, price, units_sold)
VALUES
('N1280', 'Nokia', 199, 1925),
('Iphone 4', 'Apple', 399, 9436),
('Galaxy S', 'Samsung', 299, 2359),
('S5620 Monte', 'Samsung', 250, 2385),
('N8', 'Nokia', 150, 7543);

-- Display all records
SELECT * FROM phones;

-- Display phone name and manufacturer
SELECT name, manufacturer FROM phones;

-- Display phone name and price
SELECT name, price FROM phones;

-- Calculate total revenue (Price × Units Sold)
SELECT
    name,
    price * units_sold AS total_revenue
FROM phones;

-- Display phones with price greater than 250
SELECT * FROM phones WHERE price > 250;

-- Display Samsung phones
SELECT * FROM phones WHERE manufacturer = 'Samsung';

SELECT name, price FROM phones WHERE units_sold > 5000;

SELECT name, manufacturer FROM phones WHERE manufacturer IN ('Apple', 'Samsung');

-- Display those phone who total_revenue >1000000
SELECT name, price * units_sold  AS total_revenue FROM phones WHERE price * units_sold > 1000000;

-- To update the phone -> set keyword
UPDATE phones SET units_sold = 8543 WHERE name = 'N8';

-- DELETE 
DELETE FROM phones WHERE manufacturer = 'Samsung';

-- Display table
SELECT * FROM phones;