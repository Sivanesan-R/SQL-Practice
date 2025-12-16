select 
	OrderID,
	CreationTime,
	day(CreationTime) as day,
	month(CreationTime) as month,
	year(CreationTime) as Year
from Sales.Orders

select
	orderID,
	CreationTime,
	datepart(year,CreationTime) as YearPart,
	datepart(month,CreationTime) as monthpart,
	datepart(day,CreationTime) as daypart,
	datepart(hour,CreationTime) as hourpart,
	datepart(QUARTER,CreationTime) as quater,
	datepart(week,CreationTime) as weekpart
from Sales.Orders

select 
	OrderID,
	CreationTime,
	DATENAME(month,CreationTime) as nameOFDate,
	DATENAME(weekday,CreationTime) as nameOFDate
from Sales.Orders

select 
	OrderID,
	CreationTime,
	DATETRUNC(MINUTE,CreationTime) as min_dt,
	DATETRUNC(HOUR,CreationTime) as hour_dt,
	DATETRUNC(DAY,CreationTime) as day_dt,
	DATETRUNC(MONTH,CreationTime) as month_dt,
	DATETRUNC(year,CreationTime) as year_dt
from Sales.Orders

select 
	EOMONTH(CreationTime) as endOfTheMonth,
	cast(DATETRUNC(Month,CreationTime) as DATE) as StartingOfMonth
from Sales.Orders


select
	datepart(month,OrderDate),
	COUNT(*) as noOfOrders
from Sales.Orders
group by datepart(month,OrderDate);

select * 
from Sales.Orders
where month(OrderDate) = 2;