SELECT 
	*
FROM customers as c
LEFT JOIN orders as o
ON c.id = o.customer_id
where c.id is null