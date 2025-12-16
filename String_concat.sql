select 
	FirstName,
	Country,
	CONCAT(FirstName,' ',LastName) as Full_Name,
	upper(FirstName) as Upper_name,
	LOWER(LastName) as Lower_name,
	trim(FirstName)
from Sales.Customers;