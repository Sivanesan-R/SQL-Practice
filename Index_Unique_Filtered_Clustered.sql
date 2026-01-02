select * from Sales.Products

create unique nonclustered index idx_for_product
on Sales.Products ([Product])


select * from Sales.Customers

create nonclustered index idx_for_customer_Country
on Sales.Customers (Country)
where Country = 'USA'
