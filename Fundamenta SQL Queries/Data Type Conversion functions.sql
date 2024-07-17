--- Converting Numbers/ Date to String

SELECT Sales, 'Total sales value for this order is' || TO_CHAR(Sales, '9999.99') AS Message
FROM Sales;

SELECT Sales, 'Total sales value for this order is' || TO_CHAR(Sales, '$9999.99') AS Message
FROM Sales;

SELECT Sales, 'Total sales value for this order is' || TO_CHAR(Sales, '$9,999.99') AS Message
FROM Sales;

SELECT Order_date, TO_CHAR(Order_date, 'DDMMYY') FROM Sales;

SELECT Order_date, TO_CHAR(Order_date, 'Month DD YY') FROM Sales;

SELECT Order_date, TO_CHAR(Order_date, 'MONTH DD YY') FROM Sales;

SELECT Order_date, TO_CHAR(Order_date, 'MONTH DAY YY') FROM Sales;

SELECT Order_date, TO_CHAR(Order_date, 'Month Day Year') FROM Sales;

--- Converting Numbers/ Date

SELECT To_date('2019/01/15', 'YYY/MM/DD');
SELECT To_date('26122018', 'DDMMYY');

SELECT To_number('2045.876', '9999.999');
SELECT To_number('$2,045.876', 'L9,999.999');