select 
*,
Case 
	when valuedCold = 1 then 'High'
	when valuedCold = 2   then 'Medium'
	when valuedCold = 3  then 'Low'
	else 'Not Applicable'
end SalesSegmets
from(
	select 
	OrderID,
	Sales,
	NTILE(3) over(order by Sales desc) valuedCold
	from Sales.Orders
)t


select 
ntile(2) over(Order By OrderID) as Bucket,
*
from Sales.Orders;


select 
OrderID,
ProductID,
CustomerID,
Sales,
CUME_DIST() over(Order by Sales desc) as percentageCal2,
PERCENT_RANK() over(Order by Sales desc) as percentageCal1
from Sales.Orders


select 
*,
CUME_DIST() over(Order by Price desc) per1,
PERCENT_RANK() over(Order by Price desc) per2
from Sales.Products;