--- Sub quries
SELECT * FROM Sales
WHERE Customer_id IN (SELECT Customer_id FROM Customer WHERE Age > 60);

SELECT a.product_id, a.product_name, a.category, b.quantity
FROM Product as a
LEFT JOIN(SELECT product_id, sum(quantity) AS quantity FROM Sales GROUP BY Product_id) AS b
ON a.product_id= b.product_id
ORDER BY b.quantity DESC;

SELECT Customer_id, order_line, (SELECT Customer_name FROM Customer WHERE Customer.Customer_id = Sales.customer_id)
From Sales ORDER BY Customer_id;

