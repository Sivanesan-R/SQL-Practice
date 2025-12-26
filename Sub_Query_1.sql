select 
AVG(Sales) as Sales
from Sales.Orders

select 
CustomerID 
from Sales.Orders

select 
OrderID,
OrderDate
From Sales.Orders

select 
*
from(
	select 
	ProductID,
	Product,
	Price,
	avg(Price) over() as AvgPrice
	from Sales.Products
)t
where Price > AvgPrice;


select 
*,
DENSE_RANK() over(Order by TotalSales desc) RankedSales
from(
	select 
	CustomerID,
	sum(Sales) TotalSales
	from Sales.Orders
	group by CustomerID
)t


select 
ProductID,
Product,
Price,
	(select
	count(*)
	from Sales.Orders) as TotalSales
from Sales.Products;


--Main Query
select
c.*,
o.TotalOrders
from Sales.Customers c
left join(			--sub Query
	select 
	CustomerID,
	COUNT(*) TotalOrders
	from Sales.Orders
	group by CustomerID
) o
on c.CustomerID = o.CustomerID;


--find the product that have a price higher than the average price of all products.

--Main Query
select 
ProductID,
Price
from Sales.Products
where Price > (select AVG(Price) as AvgPrice from Sales.Products);	--Sub Query


--Show the details of Orders made by customers in Germany

--Main Query
select 
*
from Sales.Orders
where CustomerID in (select CustomerID from Sales.Customers where Country = 'Germany')	--Sub Query


--Show the details of Orders for customers who are not from Germany.
--Main Query
select 
*
from Sales.Orders
where CustomerID not in (select CustomerID from Sales.Customers where Country = 'Germany')	--Sub Query


--Find female employees whose salaries are greater
--than the salaries of ANY male employees.

select 
	EmployeeID,
	FirstName,
	Gender,
	Salary
from Sales.Employees
where Gender = 'F'
and Salary > any(select Salary from Sales.Employees where Gender = 'M')



--Find female employees whose salaries are greater
--than the salaries of ALL male employees.

select 
	EmployeeID,
	FirstName,
	Gender,
	Salary
from Sales.Employees
where Gender = 'F'
and Salary > all(select Salary from Sales.Employees where Gender = 'M')


--show all customers details and find the total order for each customers.

select 
* ,
	(select 
	COUNT(*)
	from Sales.Orders o
	where o.CustomerID = c.CustomerID) TotalSales
from Sales.Customers c


--show the details of orders made by customers in Germany

select
* 
from Sales.Orders o
where exists (
	select 
	* 
	from Sales.Customers c
	where Country = 'Germany'
	and o.CustomerID = c.CustomerID
)