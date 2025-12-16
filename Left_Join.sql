SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers as c
LEFT JOIN orders as o
ON c.id = o.customer_id;
