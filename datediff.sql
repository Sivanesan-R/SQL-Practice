select 
	OrderDate,
	ShipDate,
	DATEDIFF(YEAR,OrderDate,ShipDate) as yeardiff,
	DATEDIFF(MONTH,OrderDate,ShipDate) as monthdiff,
	DATEDIFF(DAY,OrderDate,ShipDate) as datdiff
from Sales.Orders;

select
	EmployeeID,
	FirstName,
	BirthDate,
	datediff(year,BirthDate,GETDATE()) as Emp_age
from Sales.Employees;

select 
	month(OrderDate) as OrderDate,
	avg(DATEDIFF(DAY,OrderDate,ShipDate)) as avg_ship_day
from Sales.Orders
group by month(OrderDate);


select
	OrderID,
	OrderDate
from Sales.Orders