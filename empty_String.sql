with Orders as(
select 1 Id, 'A' Category union
select 2, null union
select 3, '' union
select 4, ' '
)

select *,
trim(Category) as trimedvalue,
datalength(trim(Category)) as policy1,
nullif(TRIM(Category),'') policy2, -- use policy2 for the best optimized storage because null have no values.
coalesce(nullif(TRIM(Category),''),'unknown') as policy3 --that store some values in the database
from Orders;