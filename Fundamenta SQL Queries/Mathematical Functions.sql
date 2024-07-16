--- Ceil & Floor

SELECT Order_line, Sales, CEIL(Sales), FLOOR(Sales) FROM Sales;

--- Random

/*
a = 10
b = 50
*/

SELECT RANDOM(), RANDOM()*40+ 10, FLOOR(RANDOM()*40)+10;

--- Set seed

SELECT SETSEED(0.5);
SELECT RANDOM();

SELECT SETSEED(0.5);
SELECT RANDOM();

SELECT Order_line, Sales, ROUND(Sales) FROM Sales ORDER BY Sales DESC;

--- Power

SELECT POWER(Age, 2), Age FROM Customer;
