select
productID,
OrderID,
COUNT(*) over() as totalOrders,
count(*) over(partition by productID) as productSeparate
from Sales.Orders

select *,
count(*) over() as TotalCustomers,
COUNT(Score) over() as TotalScore,
COUNT(Country) over() as TotalCountry
from Sales.Customers


select *
from(
	select 
	OrderID,
	OrderDate,
	COUNT(*) over(partition by OrderID) as TotalOrders
	from Sales.OrdersArchive
)t where TotalOrders > 1;


select 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over() as TotalSale,
	sum(Sales) over(partition by ProductID) TotalProduct
from Sales.Orders;

select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over() as Totalsales,
	round(cast(Sales as float) / sum(Sales) over() * 100,2) as percentages
from Sales.Orders;

select 
OrderID,
OrderDate,
ProductID,
Sales,
AVG(Sales) over() as AvgOfSales,
AVG(Sales) over(partition by ProductID) as AvgOfProduct
from Sales.Orders;

select
	CustomerID,
	FirstName,
	LastName,
	Score,
	coalesce(Score,0) as withoutNull,
	avg(Score) over() as AvgOfScore,
	avg(coalesce(Score,0)) over() as AvgOfScoWithoutNull
from Sales.Customers;

select
*
from(
	select 
		OrderID,
		OrderDate,
		ProductID,
		Sales,
		AVG(Sales) over() AvgSales
	from Sales.Orders
)t
where Sales > AvgSales;


select 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(Sales) over() HigValue,
	MAX(Sales) over(Partition by ProductID) HighProductValue,
	Min(Sales) over() LowValue,
	min(Sales) over(Partition by ProductID) LowProductValue
from Sales.Orders;


select 
*
From(
	select 
		*,
		Max(Salary) Over() HighSalary
	from Sales.Employees
)t 
where Salary = HighSalary;