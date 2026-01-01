select 
* 
into #TempOrder
from Sales.Orders

select 
*
from dbo.#TempOrder

delete from dbo.#TempOrder
where OrderStatus = 'Delivered'

select 
* 
into Sales.OrderTest
from dbo.#TempOrder