-- Goup By

SELECT Region, COUNT(Customer_id) as Customer_count FROM Customer GROUP BY Region;

SELECT Product_id, SUM(Quantity) AS Quantity_sold FROM Sales GROUP BY Product_id
 ORDER BY Quantity_sold DESC;

SELECT Customer_id, MIN(Sales) AS "Minimum Sales", MAX(Sales) as "Max Sales",
AVG(Sales) AS "Average Sales", SUM(Sales) AS "Total Sales" FROM Sales GROUP BY Customer_id
ORDER BY "Total Sales" DESC LIMIT 5;

SELECT Region, AVG(Age) AS Age, COUNT(Customer_id) as Customer_count FROM Customer GROUP BY Region;

SELECT Region, State, AVG(Age) AS Age, COUNT(Customer_id) as Customer_count FROM Customer GROUP BY Region, State;


--- Having

SELECT Region, COUNT(Customer_id) AS Customer_count FROM Customer GROUP BY
Region HAVING COUNT(Customer_id) > 200;

SELECT Region, COUNT(Customer_id) AS Customer_count FROM Customer WHERE Customer_name LIKE 'A%'
GROUP BY Region;

SELECT Region, COUNT(Customer_id) AS Customer_count FROM Customer WHERE Customer_name LIKE 'A%'
GROUP BY Region HAVING COUNT(Customer_id) > 15;