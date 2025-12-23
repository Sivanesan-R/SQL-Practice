select 
OrderID,
ProductID,
Sales,
first_value(Sales) over(partition by ProductID Order by Sales) LowestSales,
LAST_VALUE(Sales) over(partition by ProductID Order by Sales
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING ) HighestValue,
first_value(Sales) over(partition by ProductID Order by Sales desc) HighestValue2,
min(Sales) over(partition by ProductID) LowestSales2,
max(Sales) over(partition by ProductID) HighestSales3,
Sales - first_value(Sales) over(partition by ProductID Order by Sales) DiffOfSales
from Sales.Orders