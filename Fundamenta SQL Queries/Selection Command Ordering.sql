-- Order by

SELECT * FROM Customer WHERE State = 'California' ORDER BY Customer_name;
SELECT * FROM Customer WHERE State = 'California' ORDER BY Customer_name DESC;
SELECT * FROM Customer ORDER BY City ASC, Customer_name DESC;
SELECT * FROM Customer ORDER BY 2 ASC;
SELECT * FROM Customer ORDER BY Age DESC;

-- Limit

SELECT * FROM Customer WHERE Age > 25 ORDER BY Age DESC LIMIT 8;
SELECT * FROM Customer WHERE Age > 25 ORDER BY Age ASC LIMIT 10;