--Generate a sequence of Numbers from 1 to 20

with Series as (

	--Anchor Query
	select 
	1 as myNumber
	union all
	-- Recursive Query
	select
	myNumber + 1
	from Series
	where myNumber < 20

)

--Main Query

select * 
from Series
option (maxrecursion 10)
