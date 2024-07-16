--- Views

CREATE VIEW Logistics AS
SELECT a.Order_line, a.Order_id, b.Customer_name, b.City, b.State, b.Country
FROM Sales AS a
LEFT JOIN Customer as b
ON a.Customer_id = b.Customer_id
ORDER BY a.Order_line;

SELECT * FROM Logistics;

DROP VIEW Logistics;


--- Index

CREATE INDEX Mon_idx ON Month_values(MM);

DROP INDEX Mon_idx;

--- 