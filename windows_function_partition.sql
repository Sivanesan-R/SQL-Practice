select 
OrderID,
OrderDate,
ProductID,
Sales,
OrderStatus,
sum(Sales) over () as sumOfSale,
sum(Sales) over (partition by productID) as TotalSale,
sum(Sales) over (partition by productID,OrderStatus) as salesbyOrder
from Sales.Orders