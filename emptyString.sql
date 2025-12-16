with Orders as (
select 1 Id, 'A' Category union
select 2,  null union
select 3, '' union
select 4, ' '
)
select 
*,
datalength(Category) as categorylen
from Orders;
