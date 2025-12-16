select
	OrderDate,
	isdate(OrderDate),
	case when isdate(OrderDate) = 1 then cast(OrderDate as date)
	end newOrderDate
from(
	select '2025-10-2' as OrderDate union
	select '2025-11-3' union
	select '2025-4-3' union
	select '2023/12/'
)t