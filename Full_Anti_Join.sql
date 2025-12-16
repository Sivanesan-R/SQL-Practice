SELECT 
	*
FROM customers as c
FULL JOIN orders as o
ON c.id = o.customer_id
where o.order_id is null OR id is null;