select * from customers
where not (score < 500); 

select * from customers
where  score >= 100 and score <= 500;

select * from customers
where country in ('USA','Germany');

select * from customers
where country not in ('USA','Germany');

select * from customers
where first_name like '__r%';