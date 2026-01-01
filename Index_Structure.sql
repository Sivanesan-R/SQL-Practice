select *
into Sales.DBCustomers
from Sales.Customers

select * 
from Sales.Customers
where CustomerID = 1

--Clustered

create clustered index idx_Cus_id
on Sales.DBCustomers (CustomerID)

create clustered index idx_First_Name
on Sales.DBCustomers (FirstName)

drop index idx_First_Name on Sales.DBCustomers


--Non Clustered

select * 
from Sales.Customers
where LastName = 'Brown'

create nonclustered index idx_Last_Name
on Sales.DBCustomers (LastName)

create index idx_cus_FirstName
on Sales.DBCustomers (FirstName)