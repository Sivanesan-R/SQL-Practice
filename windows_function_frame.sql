select 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	sum(Sales) over(partition by OrderStatus order by OrderDate 
	rows unbounded preceding) as totalSum
from Sales.Orders
