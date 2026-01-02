select * from Sales.Customers

create clustered columnstore index idx_Col_sto
on Sales.DBCustomers

create columnstore index idx_Col
on Sales.DBCustomers

drop index [idx_Last_Name] on Sales.DBCustomers