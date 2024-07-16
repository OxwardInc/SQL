--- Curent Date & Time

SELECT Current_date, Current_time, Current_time(1), Current_time(3), Current_timestamp;

--- Age

SELECT Age('2018-12-27', '2017-06-03');

SELECT Order_line,
	Ship_date,
	Order_date,
	age(Ship_date, Order_date) AS Time_taken
FROM Sales
ORdER BY Time_taken DESC;

SELECT Order_line,
	Ship_date,
	Order_date,
	age(Ship_date, Order_date) AS Time_taken
FROM Sales
ORdER BY Time_taken ASC;

--- Extract

SELECT EXTRACT(Day FROM Current_date);

SELECT Current_timestamp, EXTRACT(Hour FROM Current_timestamp);

SELECT Order_date, Ship_date, EXTRACT (EPOCH FROM (Ship_date-Order_date))
FROM Sales; --- Error

SELECT Order_date, Ship_date, (EXTRACT (EPOCH FROM Ship_date) - EXTRACT (EPOCH FROM Order_date)) 
	AS Sec_token FROM Sales;

