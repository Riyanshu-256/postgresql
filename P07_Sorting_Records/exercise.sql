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

-- Display the 2nd and 3rd most expensive phones
SELECT name FROM phones ORDER BY price DESC LIMIT 2 Offset 1;