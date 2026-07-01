-- create a table of phones
CREATE TABLE phones (
    name VARCHAR(50),
    manufacturer VARCHAR(50),
    price INTEGER,
    units_sold INTEGER
);


-- Insert data in the table 
INSERT INTO phones (name, manufacturer, price, units_sold)
VALUES 
    ('N1280', 'Nokia', 199, 1925),
    ('Iphone 4', 'Apple', 399, 9436),
    ('galaxy 5', 'Samsung', 299, 2539),
    ('S5620 Monte', 'Samsung', 250, 2385),
    ('N8', 'Nokia', 150, 7543),
    ('Droid', 'Motorola', 150, 8395),
    ('Wave S8500', 'Samsung', 175, 9259);


-- Print for the manufacturer who have revenue greater than 2000000 for all the phones they sold
SELECT manufacturer, SUM(price * units_sold) AS revenue
FROM phones
GROUP BY manufacturer
HAVING SUM(price * units_sold) > 2000000;
