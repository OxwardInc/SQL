--- Case When

SELECT *, CASE 
	WHEN Age < 30 THEN 'Young'
	WHEN Age > 60 THEN 'Senior Citizen'
	ELSE 'Middle Aged'
	END AS Age_category
FROM Customer;