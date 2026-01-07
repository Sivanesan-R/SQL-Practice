create database JDBCdemo;

use jdbcdemo

create table employee(
	emp_id int primary key,
	emp_name varchar(50),
	salary int
);

insert into employee
values (1,'Ram',10000);

select * from employee