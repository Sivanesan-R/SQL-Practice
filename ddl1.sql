select distinct top 2 
	country,
	avg(score) as avgg_score
from customers 
where score > 100
group by country
having avg(score) > 400
order by avgg_score;