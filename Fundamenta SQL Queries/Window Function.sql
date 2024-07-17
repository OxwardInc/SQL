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

SELECT * FROM (SELECT Customer_id, Customer_name, State, Order_num, Row_number() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Row_n
	FROM Customer_order) AS a WHERE a.Row_n <= 3;

--- Rank & Densrank

SELECT Customer_id, Customer_name, State, Order_num, 
	ROW_NUMBER() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Row_n,
	RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Rank_n,
	DENSE_RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS D_Rank_n
	FROM Customer_order;

--- NTile Function

SELECT Customer_id, Customer_name, State, Order_num, 
	ROW_NUMBER() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Row_n,
	RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Rank_n,
	DENSE_RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS D_Rank_n,
	NTILE(5) OVER (PARTITION BY State ORDER BY Order_num DESC) AS tILE_n
	FROM Customer_order;

SELECT * FROM (
	SELECT Customer_id, Customer_name, State, Order_num, 
	ROW_NUMBER() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Row_n,
	RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Rank_n,
	DENSE_RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS D_Rank_n,
	NTILE(5) OVER (PARTITION BY State ORDER BY Order_num DESC) AS TiLE_n
	FROM Customer_order
) WHERE Tile_n = 1;

SELECT * FROM (
	SELECT Customer_id, Customer_name, State, Order_num, 
	ROW_NUMBER() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Row_n,
	RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS Rank_n,
	DENSE_RANK() OVER (PARTITION BY State ORDER BY Order_num DESC) AS D_Rank_n,
	NTILE(5) OVER (PARTITION BY State ORDER BY Order_num DESC) AS TiLE_n
	FROM Customer_order
)AS a WHERE a.Tile_n = 5;

--- Average

SELECT * FROM Customer_order;

SELECT * FROM (SELECT Customer_id, Customer_name, State, Sales_tot AS Revenue, AVG(Sales_tot)
OVER (PARTITION BY State) AS Avg_revenue
FROM Customer_order) AS a WHERE a.Revenue < a.Avg_revenue;

--- Count

SELECT Customer_id, Customer_name, State, COUNT(Customer_id) OVER (PARTITION BY State)
 AS Count_cust FROM CUstomer_order;

--- Sum Total

SELECT * FROM Sales;

SELECT Order_id, MAX(Order_date) AS Order_date, MAX(Customer_id) AS Customer_id,
SUM(Sales) AS Sales FROM Sales GROUP BY Order_id;

CREATE TABLE Order_rollup AS SELECT Order_id, MAX(Order_date) AS Order_date, MAX(Customer_id) AS Customer_id,
SUM(Sales) AS Sales FROM Sales GROUP BY Order_id;

CREATE TABLE Order_rollup_state AS SELECT a.*, b.State 
FROM Order_rollup AS a
LEFT JOIN Customer AS b
ON a.Customer_id = b.Customer_id;


SELECT * FROM Order_rollup_state;

SELECT *,
SUM(Sales) OVER (PARTITION BY State) AS Sales_state_total
FROM Order_rollup_state;

--- Running Total

SELECT *,
SUM(Sales) OVER (PARTITION BY State) AS Sales_state_total,
SUM(Sales) OVER (PARTITION BY Order_date) AS Running_total
FROM Order_rollup_state;

--- LAG & LEAD 

SELECT Customer_id, Order_date, Order_id, Sales, 
	LAG(Sales, 1) OVER(PARTITION BY Customer_id ORDER BY Order_date) AS Previous_saless,
	LAG(Order_id, 1) OVER(PARTITION BY Customer_id ORDER BY Order_date) AS Previous_order_id
FROM Order_rollup_state;

SELECT Customer_id, Order_date, Order_id, Sales, 
	LAG(Sales, 2) OVER(PARTITION BY Customer_id ORDER BY Order_date) AS Previous_saless,
	LAG(Order_id, 2) OVER(PARTITION BY Customer_id ORDER BY Order_date) AS Previous_order_id
FROM Order_rollup_state;

SELECT Customer_id, Order_date, Order_id, Sales, 
	LEAD(Sales, 1) OVER(PARTITION BY Customer_id ORDER BY Order_date) AS Previous_saless,
	LEAD(Order_id, 1) OVER(PARTITION BY Customer_id ORDER BY Order_date) AS Previous_order_id
FROM Order_rollup_state;

