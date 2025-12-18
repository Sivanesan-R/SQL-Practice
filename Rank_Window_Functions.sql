select 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER()	over(order by Sales desc) as RankValue,
	RANK()			over(Order by Sales desc) as OrderRankValue,
	DENSE_RANK()	over(Order by Sales desc) DesscRank
from Sales.Orders;

select
*
from (
	select 
	OrderID,
	ProductID,
	Sales,
	DENSE_RANK() over (partition by ProductID Order by Sales desc) DescRank
	from Sales.Orders
)t
where DescRank = 1;

select *
from(	select 
	CustomerID
	ProductID,
	sum(Sales) as TotalSales,
	ROW_NUMBER() over (order by sum(Sales)) RankBCustomers
	from Sales.Orders
	group by CustomerID
)t
where RankBCustomers <= 2



select 
ROW_NUMBER() Over(Order by OrderID,OrderDate) UniqueID,
* 
from Sales.OrdersArchive;

select
*
from(
	select
	ROW_NUMBER() over(Partition by OrderID order by CreationTime) as uniqueID,
	*
	from Sales.OrdersArchive
)t
where uniqueID = 1;


select 
	OrderID,
	OrderDate,
	Sales,
	NTILE(1) over(Order by sales desc) OneBucket,
	NTILE(2) over(Order by sales desc) TwoBucket,
	NTILE(3) over(Order by sales desc) ThreeBucket,
	NTILE(4) over(Order by sales desc) fourBucket
from Sales.Orders;



