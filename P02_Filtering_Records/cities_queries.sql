-- Create the 'cities' table
CREATE TABLE cities (
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);

-- Insert sample records into the table
INSERT INTO cities (name, country, population, area)
VALUES
('DELHI', 'INDIA', 32900000, 1484),
('SHANGHAI', 'CHINA', 24870000, 6341),
('NEW YORK', 'USA', 18800000, 783),
('LONDON', 'UK', 9648000, 1572),
('PARIS', 'FRANCE', 11020000, 105),
('SYDNEY', 'AUSTRALIA', 5312000, 12368);

-- Retrive or Display all records from the cities table data from database
SELECT * FROM cities;

-- Retrive specific column data
SELECT name, country FROM cities;

-- Perfom operation
-- AS total gives a meaningful name to the calculated column
SELECT name, population + area  AS total FROM cities;
SELECT name, population / area AS density FROM cities;

-- String operation
SELECT name || ',' || country FROM cities;
SELECT CONCAT(UPPER(name), ',', UPPER(country)) AS location FROM cities;

-- Comparison Math Operations

-- Filtering rows with where
SELECT name, area FROM cities WHERE area > 4000;
SELECT name, area FROM cities WHERE area = 1572;

-- != and <> give same result
SELECT name, area FROM cities WHERE area != 1572;
SELECT name, area FROM cities WHERE area <> 1572;

SELECT name, area FROM cities WHERE name NOT IN ('Delhi', 'Shanghai');
SELECT name, area FROM cities WHERE name IN ('Delhi', 'Shanghai');

-- Update cities
UPDATE cities
SET population = 399999999
WHERE name = 'PARIS';

-- Delete cities
DELETE  FROM cities WHERE name = 'SYDNEY';

