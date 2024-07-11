SELECT * FROM Customer WHERE City IN ('Philadelpha', 'Seattle');
SELECT * FROM Customer WHERE City = 'Philadelpha' OR City =  'Seattle';

/* Between */

SELECT * FROM Customer WHERE Age BETWEEN 20 AND 30;
SELECT * FROM Customer WHERE Age >= 20 AND Age <= 30;
SELECT * FROM Customer WHERE Age NOT BETWEEN 20 AND 30;
SELECT * FROM Sales WHERE Ship_date BETWEEN '2015-04-01' AND '2016-04-01';

/* Like*/

SELECT * FROM Customer WHERE Customer_name LIKE 'J%';
SELECT * FROM Customer WHERE Customer_name LIKE '%Nelson%';
SELECT * FROM Customer WHERE Customer_name LIKE '____%';
SELECT DISTINCT City FROM Customer WHERE City NOT LIKE 'S%';
SELECT * FROM Customer WHERE Customer_name LIKE 'G\%';

