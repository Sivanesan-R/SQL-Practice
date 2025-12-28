
create view Sales.V_Monthly_Summary as
(
select 
	DATETRUNC(MONTH,OrderDate) OrderMonth,
	SUM(Sales) as TotalSales,
	count(OrderID) as TotalOrder,
	sum(Quantity) as TotalQuantity
	from Sales.Orders
	group by DATETRUNC(MONTH,OrderDate)
)

select * from Sales.V_Monthly_Summary


select
	OrderMonth,
	TotalSales,
	sum(TotalSales) over (Order by OrderMonth) as RunningTotal
from Sales.V_Monthly_Summary

drop view Sales.V_Monthly_Summary

