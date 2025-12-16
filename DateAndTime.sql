select 
	OrderID
	CreationTime,
	'2025-12-02' as Hadecoder,
	GETDATE() today
from Sales.Orders