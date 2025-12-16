select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
from customers as c
RIGHT JOIN orders as o
ON c.id = o.customer_id;