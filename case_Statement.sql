select 
	Category,
	sum(Sales) as TotalSales
from(
select 
	OrderID,
	Sales,
	case when Sales > 50 then 'High'
		when Sales > 20 then 'Medium'
		else 'Low'
	end as Category
from Sales.Orders
)t
group by Category
order by TotalSales desc



select 
	EmployeeID,
	FirstName,
	LastName,
	Gender,
	case
		when Gender = 'M' then 'Male'
		when Gender = 'F' then 'Female'
		else 'Not Available'
	end as GenderFullText
from Sales.Employees

select 
	CustomerID,
	FirstName,
	LastName,
	Country,
	case 
		when Country = 'Germany' then 'GE'
		when Country = 'USA' then 'US'
		else 'Not Available'
	end as CountrySimpleFormat
from Sales.Customers;

select distinct Country 
from Sales.Customers;



select 
	CustomerID,
	FirstName,
	LastName,
	Country,
	case Country
		when 'Germany' then 'GE'
		when 'USA' then 'US'
		else 'Not Available'
	end as CountrySimpleFormat2
from Sales.Customers;


SELECT 
    CustomerID,
    FirstName,
    LastName,
    Score,
    CASE 
        WHEN Score IS NULL THEN 0 
        ELSE Score 
    END AS ScoreClean,
    AVG(
        CASE 
            WHEN Score IS NULL THEN 0 
            ELSE Score 
        END
    ) OVER () AS AvgCusClean,
    AVG(Score) OVER () AS AvgCustomer
FROM Sales.Customers;


select
	CustomerID,
	sum(case 
		when Sales > 30 then 1
		else 0
	end) totalOrders,
	count(*) CountOrders
from Sales.Orders
group by CustomerID