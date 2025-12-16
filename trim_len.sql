select
	first_name,
	len(first_name)  len_of_name,
	len(trim(first_name))  trimed_Name,
	len(first_name) - len(trim(first_name)) as space_values
from Customers
where LEN(first_name) != len(Trim(first_name))
--where first_name != TRIM(first_name);
