--Show the employee hierarchy by displaying each employee's level within the organization.

with CTE_emp_hie as
(
	--Anchor Query
	select 
		EmployeeID,
		FirstName,
		ManagerID,
		1 as level
	from Sales.Employees
	where ManagerID is null
	union all
	--Recursive Query
	select 
		e.EmployeeID,
		e.FirstName,
		e.ManagerID,
		level + 1
	from Sales.Employees as e
	inner join CTE_emp_hie ceh
	on e.ManagerID = ceh.EmployeeID
)

--Main Query
select 
* 
from CTE_emp_hie