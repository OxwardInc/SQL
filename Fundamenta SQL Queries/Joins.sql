--- Introduction to Joins
--- Concepts of Joining and Combining Data
--- Preparing the data

/*Creating Sales table for year 2015*/
CREATE TABLE Sales_2015 AS SELECT * FROM Sales WHERE Ship_date BETWEEN '2015-01-01'
AND '2015-12-31';

SELECT COUNT(*) FROM Sales_2015; --2131

/*Creating Customers with age between 20 and 60*/
CREATE TABLE Customer_20_60 AS SELECT * FROM Customer WHERE Age BETWEEN 20 AND 60;
SELECT COUNT(*) FROM Customer_20_60; --597
SELECT COUNT(DISTINCT Customer_id) FROM Sales_2015; --578

--- Inner Join
SELECT Customer_id FROM Sales_2015 ORDER BY Customer_id;
SELECT Customer_id FROM Customer_20_60 ORDER BY Customer_id;

SELECT
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
FROM Sales_2015 AS a
INNER JOIN Customer_20_60 as b
ON a.customer_id = b.customer_id
ORDER BY customer_id;


SELECT Sales_2015.Order_line, Sales_2015.Product_id, Sales_2015.Customer_id,
	Sales_2015.Sales, Customer_20_60.Customer_name, Customer_20_60.Age
FROM Sales_2015
INNER JOIN Customer_20_60 ON Customer_20_60.Customer_id = Sales_2015.Customer_id;

--- Left Join

SELECT Customer_id FROM Sales_2015 ORDER BY Customer_id;
SELECT Customer_id FROM Customer_20_60 ORDER BY Customer_id;

/*
AA-10315 not present in Customer_20_60 table
AA-10375 present in both
AA-10480 not present in Sales_2015 table
*/

SELECT a.Order_line,
	a.Product_id,
	a.Customer_id,
	a.Sales,
	b.Customer_name,
	b.Age
FROM Sales_2015 AS a LEFT JOIN Customer_20_60 AS b ON a.customer_id = b.customer_id
ORDER BY customer_id;


SELECT Sales_2015.Order_line, Sales_2015.Product_id, Sales_2015.Customer_id,
	Sales_2015.Sales, Customer_20_60.Customer_name, Customer_20_60.Age
FROM Sales_2015
LEFT JOIN Customer_20_60 ON Customer_20_60.Customer_id = Sales_2015.Customer_id;


--- Right Join

SELECT Customer_id FROM Sales_2015 ORDER BY Customer_id;
SELECT Customer_id FROM Customer_20_60 ORDER BY Customer_id;

/*
AA-10315 not present in Customer_20_60 table
AA-10375 present in both
AA-10480 not present in Sales_2015 table
*/

SELECT a.Order_line,
	a.Product_id,
	a.Customer_id,
	a.Sales,
	b.Customer_name,
	b.Age
FROM Sales_2015 AS a RIGHT JOIN Customer_20_60 AS b ON a.customer_id = b.customer_id
ORDER BY customer_id;

SELECT Sales_2015.Order_line, Sales_2015.Product_id, Sales_2015.Customer_id,
	Sales_2015.Sales, Customer_20_60.Customer_name, Customer_20_60.Age
FROM Sales_2015
RIGHT JOIN Customer_20_60 ON Customer_20_60.Customer_id = Sales_2015.Customer_id;


--- Full Outer Join

SELECT Customer_id FROM Sales_2015 ORDER BY Customer_id;
SELECT Customer_id FROM Customer_20_60 ORDER BY Customer_id;

/*
AA-10315 not present in Customer_20_60 table
AA-10375 present in both
AA-10480 not present in Sales_2015 table
*/

SELECT a.Order_line,
	a.Product_id,
	a.Customer_id,
	a.Sales,
	b.Customer_name,
	b.Age,
	b.Customer_id
FROM Sales_2015 AS a FULL JOIN Customer_20_60 AS b ON a.Customer_id = b.Customer_id
ORDER BY a.Customer_id, b.Customer_id;

SELECT Sales_2015.Order_line, Sales_2015.Product_id, Sales_2015.Customer_id,
	Sales_2015.Sales, Customer_20_60.Customer_name, Customer_20_60.Age, Customer_20_60.Customer_id
FROM Sales_2015
FULL JOIN Customer_20_60 ON Customer_20_60.Customer_id = Sales_2015.Customer_id;

--- Cross Join

CREATE TABLE Month_values(MM Integer);
CREATE TABLE Year_values(YYYY Integer);

INSERT INTO Month_Values VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);
INSERT INTO Year_values VALUES (2011), (2012), (2013), (2014), (2015), (2016), (2017), (2018), (2019);

SELECT * FROM Month_values;
SELECT * FROM Year_values;

SELECT a.YYYY, b.MM FROM Year_Values AS a, Month_values AS b ORDER BY a.YYYY, b.MM;

SELECT a.YYYY, b.MM FROM Year_Values AS a CROSS JOIN Month_values AS b;

--- Combining Queries

SELECT Customer_id FROM Sales_2015;
SELECT Customer_id FROM Customer_20_60;

SELECT Customer_id FROM Sales_2015
	INTERSECT
SELECT Customer_id FROM Customer_20_60;

SELECT Customer_id FROM Sales_2015
	UNION
SELECT Customer_id FROM Customer_20_60;

--- Excepts

SELECT Customer_id FROM Sales_2015;
SELECT Customer_id FROM Customer_20_60;

/*
AA-10315 not present in Customer_20_60 table
AA-10375 present in both
AA-10480 not present in Sales_2015 table
*/

SELECT Customer_id FROM Sales_2015
EXCEPT 
SELECT Customer_id FROM Customer_20_60
ORDER BY Customer_id;

--- Union

SELECT Customer_id FROM Sales_2015
UNION
SELECT Customer_id FROM Customer_20_60
ORDER BY Customer_id;