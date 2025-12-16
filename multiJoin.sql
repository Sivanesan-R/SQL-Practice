select 
	o.OrderID,
	o.Sales,
	c.FirstName,
	c.LastName,
	p.Product as ProductName,
	p.Price,
	e.FirstName as SalesPersonFirstName,
	e.LastName as SalesPersonLastName
from Sales.Orders as o
left join Sales.Customers as c
on o.CustomerID = c.CustomerID
left join Sales.Products as p
on o.ProductID = p.ProductID
left join Sales.Employees as e
on e.EmployeeID = o.SalesPersonID