select
	OrderDate,
	dateadd(year,2,OrderDate) as addyear,
	dateadd(month,2,OrderDate) as addmonth,
	dateadd(DAY,5,OrderDate) as adddate,
	dateadd(year,-2,OrderDate) as subyear,
	dateadd(month,-2,OrderDate) as submonth,
	dateadd(DAY,-5,OrderDate) as subdate
from Sales.Orders