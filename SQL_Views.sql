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