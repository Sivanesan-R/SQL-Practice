select
	OrderID,
	CreationTime,
	format(CreationTime,'dd') as dd,
	format(CreationTime,'ddd') as ddd,
	format(CreationTime,'dddd') as dddd,
	format(CreationTime,'MM') as mm,
	format(CreationTime,'MMM') as mmm,
	format(CreationTime,'MMMM') as mmmm,
	format(CreationTime,'yy') as yyyy,
	format(CreationTime,'MM-dd-yyyy') as USA_Format,
	format(CreationTime,'dd-MM-yyyy') as Euro_Format
from Sales.Orders

select
	orderID,
	CreationTime,
	'Day ' + format(CreationTime,'ddd '+'MMM ') +
	'Q' + datename(quarter,CreationTime) +' '+ 
	FORMAT(CreationTime,'yyyy hh:mm:ss tt') as CustomFormat
from Sales.Orders
