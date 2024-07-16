--- Lenght

SELECT Customer_name, LENGTH(Customer_name) AS Characters_num FROM Customer
WHERE Age > 30;

SELECT Customer_name, LENGTH(Customer_name) AS Characters_num FROM Customer
WHERE LENGTH(Customer_name) > 15;

--- Upper & Lower

SELECT UPPER('Start-Tech-Academy');

SELECT LOWER('Start-Tech-Academy');

--- Replace

SELECT Customer_name,
	Country,
	REPLACE(Country, 'United States', 'US') AS Country_new
FROM Customer;

SELECT Customer_name,
	Country,
	REPLACE(LOWER(Country), 'united States', 'US') AS Country_new
FROM Customer;

--- Trim, Ltrim & Rtrim

SELECT TRIM(LEADING ' ' FROM '  Start-Tech Academy  ');
SELECT TRIM(TRAILING ' ' FROM '  Start-Tech Academy  ');
SELECT TRIM(BOTH ' ' FROM '  Start-Tech Academy  ');
SELECT TRIM('  Start-Tech Academy  ');
SELECT RTRIM('  Start-Tech Academy  ');
SELECT LTRIM('  Start-Tech Academy  ');

--- Concatenation

SELECT Customer_name, City|| ' , '||Country AS Address FROM Customer;

--- Substring

SELECT Customer_id, Customer_name, SUBSTRING(Customer_id FOR 2) AS Cust_group
FROM Customer
WHERE SUBSTRING(Customer_id FOR 2) = 'AB';

SELECT Customer_id, Customer_name, SUBSTRING(Customer_id FROM 2 FOR 5) AS Customer_number
FROM Customer
WHERE SUBSTRING(Customer_id FOR 2) = 'AB';

--- List Aggregator

SELECT * FROM Sales ORDER BY Order_id;

SELECT Order_id, String_agg(Product_id, ', ')
FROM Sales
GROUP BY Order_id
ORDER BY Order_id;