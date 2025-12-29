
select 
	DATENAME(MONTH,OrderDate) OrderMonth,
	COUNT(OrderID) as TotalOrders
into Sales.MonthOrders
from Sales.Orders
Group by DATENAME(MONTH,OrderDate)

Select * from Sales.MonthOrders

Drop table Sales.MonthOrders