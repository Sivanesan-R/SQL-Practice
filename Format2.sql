select 
	FORMAT(OrderDate, 'MMM yy') OrderDate,
	COUNT(*)
from Sales.Orders
group by Format(OrderDate,'MMM yy')