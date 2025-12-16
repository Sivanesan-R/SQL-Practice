select 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	RANK() over(partition by ProductId Order by Sales) as RankedCol
from Sales.Orders