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

SELECT manufacturer
FROM phones
WHERE price < 170

UNION

SELECT manufacturer
FROM phones
GROUP BY manufacturer
HAVING COUNT(*) > 2;