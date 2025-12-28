 --find the runnig total of sales for each month
with CTE_Monthly_Summary as
(
select 
	DATETRUNC(MONTH,OrderDate) OrderMonth,
	SUM(Sales) as TotalSales,
	count(OrderID) as TotalOrder,
	sum(Quantity) as TotalQuantity
	from Sales.Orders
	group by DATETRUNC(MONTH,OrderDate)
)

select
	OrderMonth,
	TotalSales,
	sum(TotalSales) over (Order by OrderMonth) as RunningTotal
from CTE_Monthly_Summary as cms



--Task : provide view that combine details from orders,products,customers and employees

create view Sales.v_Order_Details as
(
	select 
	o.OrderID,
	o.OrderDate,
	p.Product,
	p.Category,
	c.Country as CustomerCountry,
	coalesce(c.FirstName,'') +' '+ coalesce(c.LastName,'') as CustomerName,
	c.Score,
	o.Sales,
	coalesce(e.FirstName,'') + ' ' + coalesce(e.LastName,'') as EmployeeName,
	e.Department,
	Quantity
	from Sales.Orders o
	left join Sales.Products p
	on p.ProductID = o.ProductID
	left join Sales.Customers c
	on c.CustomerID = o.CustomerID
	left join Sales.Employees e
	on e.EmployeeID = o.SalesPersonID
	);

	select * from Sales.v_Order_Details;

--Provide a view for the EU Sales Team that combines details from all tables and excludes data related to the USA.
create view Sales.V_Order_Details_EU as
(
select 
	o.OrderID,
	o.OrderDate,
	p.Product,
	p.Category,
	c.Country as CustomerCountry,
	coalesce(c.FirstName,'') +' '+ coalesce(c.LastName,'') as CustomerName,
	c.Score,
	o.Sales,
	coalesce(e.FirstName,'') + ' ' + coalesce(e.LastName,'') as EmployeeName,
	e.Department,
	Quantity
	from Sales.Orders o
	left join Sales.Products p
	on p.ProductID = o.ProductID
	left join Sales.Customers c
	on c.CustomerID = o.CustomerID
	left join Sales.Employees e
	on e.EmployeeID = o.SalesPersonID
	where c.Country != 'USA'
);


select 
* 
from Sales.V_Order_Details_EU