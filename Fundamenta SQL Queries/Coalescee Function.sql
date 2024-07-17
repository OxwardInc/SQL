--- Coalesce

CREATE TABLE Emp_name(
	S_NO int,
	First_name varchar(255),
	Middle_name varchar(225),
	Last_name varchar(225)
);

INSERT INTO Emp_name (S_NO, First_name, Middle_name, Last_name) VALUES(1, 'Paul', 		'Van', 		'Hugh');
INSERT INTO Emp_name (S_NO, First_name, 			  Last_name) VALUES(2, 'David', 		 		'Flashing');
INSERT INTO Emp_name (S_NO, 			 Middle_name, Last_name) VALUES(3, 			 	'Lena', 	'Redford');
INSERT INTO Emp_name (S_NO, First_name,               Last_name) VALUES(4, 'Henry', 		 		'Goldwyn');
INSERT INTO Emp_name (S_NO, 						    Last_name) VALUES(5, 			 		 		'Holden');
INSERT INTO Emp_name (S_NO, First_name, Middle_name, Last_name) VALUES(6, 'Erin', 		'T', 		'Mull');

SELECT * FROM Emp_name;

SELECT *, COALESCE(First_name, Middle_name, Last_name) AS Name_corr FROM Emp_name;

SELECT *, 
	COALESCE(First_name, Middle_name, Last_name) AS Name_corr,
	CONCAT(First_name, Middle_name, Last_name)
FROM Emp_name;


