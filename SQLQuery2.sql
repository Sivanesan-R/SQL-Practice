create table person(
	id int primary key,
	person_name varchar(50) not null,
	birth_date date,
	phone varchar(10) not null
);

select * from person;