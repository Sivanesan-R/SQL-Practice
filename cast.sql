select
	cast('2025-12-04' as date) as datetype,
	cast('123' as int) as intType,
	cast('2025-12-04' as datetime) as timeDate,
	CreationTime,
	cast(CreationTime as date) as [String value of dateandTime]
from Sales.Orders