--- Implementing row number in SQL

SELECT * FROM Customer LIMIT 10;

SELECT * FROM Sales LIMIT 10;

SELECT a.*, b.Order_num, b.Sales_tot, b.Quantity_tot, b.Profit_tot
FROM Customer AS a
LEFT JOIN (SELECT Customer_id, COUNT (DISTINCT Order_id) AS Order_num, SUM(Sales) AS Sales_tot, SUM(Quantity) AS Quantity_tot,
	SUM(Profit) AS Profit_tot FROM Sales GROUP BY Customer_id) AS b
	ON a.Customer_id = b.Customer_id; 

SELECT * FROM Customer WHERE Customer_id = 'AA-10315';

SELECT * FROM Sales WHERE Customer_id = 'AA-10315';

SELECT * FROM Sales WHERE Customer_id = 'AA-10315' ORDER BY Order_id;

CREATE TABLE Customer_order AS (
	SELECT a.*, b.Order_num, b.Sales_tot, b.Quantity_tot, b.Profit_tot
FROM Customer AS a
LEFT JOIN (SELECT Customer_id, COUNT (DISTINCT Order_id) AS Order_num, SUM(Sales) AS Sales_tot, SUM(Quantity) AS Quantity_tot,
	SUM(Profit) AS Profit_tot FROM Sales GROUP BY Customer_id) AS b
	ON a.Customer_id = b.Customer_id
);

SELECT * FROM Customer_order;

SELECT Customer_id, Customer_name, State, Order_num, Row_number() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Row_n
	FROM Customer_order;


