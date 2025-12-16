select 
	first_name,
	left(trim(first_name),2) as left_name,
	right(first_name,3) as right_name
from customers;