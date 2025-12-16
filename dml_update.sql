update person
set phone = 'NO'
where birth_date IS NULL;

select * from person;

delete from person
where id = 5;

truncate table person;