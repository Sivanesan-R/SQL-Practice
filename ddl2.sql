create table students(
id int primary key,
name varchar(50) not null,
phone_number varchar(10) not null,
dept_name varchar(20),
date_of_birth date,
);

select * from students;

alter table students
drop column cgpa;


drop table students;