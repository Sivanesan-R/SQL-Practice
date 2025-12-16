select 
	ProductID,
	OrderID,
	OrderDate,
	sum(Sales) over(Partition by productId) as TotalSale
from Sales.Orders
