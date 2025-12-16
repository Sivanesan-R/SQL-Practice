select  *
from customers;
where score = 0

update customers
set score = 0,
	country = 'Japan'
where id = 10;

update customers
set score = 420
where score < 300;