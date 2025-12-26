--Step 1 : Find the total sales per customers (Standalone CTE)
with CTE_Total_Sales as
(
	select 
		CustomerID,
		Sum(Sales) TotalSales
	from Sales.Orders
	Group by CustomerID
)

--Step 2 : Find the last Order date for each Customers (Standalone CTE)
, CTE_Last_Order as
(
	select 
	CustomerID,
	max(OrderDate) Last_Order_Date
	from Sales.Orders
	Group by CustomerID
)
--Step 3 : RANK Customers based on total sales per Customers (Nested CTE)
, CTE_Customer_Rank as
(
select
	CustomerID,
	TotalSales,
	RANK() over(Order by TotalSales desc) CustomerRank
from CTE_Total_Sales
)


--Step 4 : Segment customers based on their total sales (Nested CTE)
, CTE_Customers_Segments As
(
	select 
	CustomerID,
	case when TotalSales > 100 then 'High'
		 when TotalSales > 80 then 'Medium'
		 else 'Low'
	end CustomerSegments
	from CTE_Total_Sales
)


--Main Query
 select 
	 c.CustomerID,
	 c.FirstName,
	 c.LastName,
	 cts.TotalSales,
	 clo.Last_Order_Date,
	 ccr.CustomerRank,
	 ccs.CustomerSegments
 from Sales.Customers c
 left join CTE_Total_Sales cts
 on cts.CustomerID = c.CustomerID
 left join CTE_Last_Order clo
 on clo.CustomerID = c.CustomerID
 left join CTE_Customer_Rank ccr
 on ccr.CustomerID = c.CustomerID
 left join CTE_Customers_Segments ccs
 on ccs.CustomerID = c.CustomerID