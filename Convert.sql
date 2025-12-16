select
OrderDate,
convert(varchar,OrderDate) as [Date to String Format],
convert(int,'12344') as [String to Int]
from Sales.Orders