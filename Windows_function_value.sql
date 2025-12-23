select 
	OrderDate,
	ProductID,
	Sales,
	month(OrderDate) OrderMonth,
	lead(Sales,2) over(order by CreationTime) as leadCol,
	lag(Sales,2) over(Order by CreationTime) as lagCol
from Sales.Orders;


select 
CustomerID,
avg(nextOrdeDate) AvgDays,
rank() over(Order by coalesce(avg(nextOrdeDate),999999)) RankAvg
from(
	select
	OrderID,
	CustomerID,
	OrderDate as CurrentDate,
	lead(OrderDate) over(partition by CustomerID Order	by OrderDate) as NextOrder,
	DATEDIFF(day,OrderDate,lead(OrderDate) over(partition by CustomerID Order	by OrderDate)) as nextOrdeDate
	from Sales.Orders
)t
group by CustomerID