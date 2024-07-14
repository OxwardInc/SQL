-- Count Function

SELECT * FROM Sales;
SELECT COUNT(*) FROM Sales;
SELECT COUNT(Order_line) AS "Number of Products Ordered", COUNT(DISTINCT Order_id)
AS "Number of Orders" FROM Sales WHERE Customer_id = 'CG-12520';

--- Sum Functions

SELECT SUM(Profit) AS "Total profit" FROM Sales;
SELECT SUM(Quantity) AS "Total quantity" FROM Sales WHERE Product_id = 'FUR-TA-10000577';

-- Average

SELECT AVG(Age) AS " Average Customer Age" FROM Customer; 
SELECT AVG(Sales * 0.1) AS "Average Cumission Value" FROM Sales;

--- Min & Max

SELECT MIN(Sales) AS "Minimum Sales Value June" FROM Sales WHERE Order_date
BETWEEN '2015-06-01' AND '2015-06-30';

SELECT Sales FROM Sales WHERE Order_date BETWEEN '2015-06-01' AND
'2015-06-30' ORDER BY Sales ASC;

SELECT MAX(Sales) AS "Maximum Sales Value June" FROM Sales WHERE Order_date
BETWEEN '2015-06-01' AND '2015-06-30';

SELECT Sales FROM Sales WHERE Order_date BETWEEN '2015-06-01' AND
'2015-06-30' ORDER BY Sales DESC;



