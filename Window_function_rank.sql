select 
CustomerID,
sum(Sales) TotalSales,
RANK() over(order by sum(Sales) desc) RankCustomers
from Sales.Orders
Group by CustomerID