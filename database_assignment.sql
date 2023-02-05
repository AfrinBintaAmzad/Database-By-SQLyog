-- Create a database named database_assignment
CREATE DATABASE database_assignment;

-- Create a table named customers
CREATE TABLE customers (
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  date_of_birth DATE,
  phone VARCHAR(20),
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  points INT
);

-- Show the table
SELECT * FROM customers; 

-- Insert the customer data in the customers table
INSERT INTO customers (first_name, last_name, date_of_birth, phone, address, city, state, points)
VALUES
  ('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', 2273),
  ('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', 947),
  ('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', 2967),
  ('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', 457),
  ('Clemmie', 'Betchley', '1973-11-07', '', '5 Spohn Circle', 'Arlington', 'TX', 3675);
  
-- Show only 2 members whose points are more than 1000.
SELECT first_name, last_name, points
FROM customers
WHERE points > 1000
LIMIT 2;

-- Find the customers whose age is in 1980 to 1990 or points less than 1000
SELECT first_name, last_name, dob, points
FROM customers
WHERE (YEAR(dob) BETWEEN 1980 AND 1990) OR (points < 1000);

-- Order the customers by points in ascending order
SELECT first_name, last_name, points
FROM customers
ORDER BY points ASC;

-- Find the customer whose name contains 'burgh' using Regular Expression
SELECT last_name
FROM customers
WHERE last_name REGEXP 'burgh$';

-- Find the customer who does not have phone number
SELECT first_name, last_name, phone
FROM customers
WHERE phone IS NULL;

-- Change the 'Date of Birth' column name into 'dob
ALTER TABLE customers CHANGE COLUMN date_of_birth  dob VARCHAR(50);

-- Find the max point holder customer name
SELECT first_name, last_name, MAX(points) FROM customers;

-- Checkin membership according to points
SELECT  first_name, last_name,
CASE
	WHEN points<1000 THEN 'Bronze member'
	WHEN points>1000 AND points<2000 THEN 'Silver member'
	WHEN points>2000 AND points<3000 THEN 'Gold member'
	ELSE 'Platinum member'
	END AS membership FROM customers;
