select 
	ShipAddress,
	BillAddress,
	coalesce(ShipAddress,BillAddress,'Unknown') as remove_nulls 
from Sales.Orders

select
	CustomerID,
	Score,
	AVG(Score) over() AvgScores,
	AVG(isnull(Score,0)) over() Avgg
from Sales.Customers

select 
	FirstName,LastName,score,
	(coalesce(score,0)+10) as add10Points,
	(FirstName + ' ' + Coalesce(Lastname,'')) as Fullname
from Sales.Customers

select 
	Score
from Sales.Customers
order by case when Score is null then 1 else 0 end,score



select 
	OrderID,
	Sales,
	Quantity,
	Sales / nullif(Quantity,0) as Prices
from Sales.Orders

select 
*
from Sales.Customers
where Score is null



select
c.*,
o.OrderID
from Sales.Customers as c
left join Sales.Orders as o
on c.CustomerID = o.CustomerID
where o.CustomerID is null