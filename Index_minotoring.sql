--List all indexes on a specific table

select
	tbl.name as TableName,
	idx.name as IndexName,
	idx.type_desc as IndexType,
	is_primary_key,
	is_unique,
	is_disabled
from sys.indexes idx
join sys.tables tbl
on idx.object_id = tbl.object_id
order by tbl.name,idx.name

select * from sys.tables