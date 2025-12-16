 
select 
	c.FirstName,
	c.LastName
From Sales.Customers as c
union
select 
	e.FirstName,
	e.LastName
from Sales.Employees as e