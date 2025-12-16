select 
	first_name,
	SUBSTRING(first_name,2,4) as subName
from customers;