select * from Sales.Orders


select
	COUNT(*) as TotalNumOfOrder,
	sum(Sales) as TotalSales,
	AVG(Sales) as AvgOfSale,
	MAX(Sales) as MaxValue,
	MIN(Sales) as MinValue
from Sales.Orders
group by CustomerID
