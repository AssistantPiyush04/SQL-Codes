-- group
-- join
-- subquery => single row ,multi row subquery\
-- join => inner, outer join, self,natural join
-- join + group by
-- set operation
-- datatypes
-- date, datetime, timestamp(1979-2038)tak leta hai timestamp

-- today topic..
-- constraint
-- set of rules & regulation => invaild data
-- declaration of table 

create database regex1;
use regex1;
create table employee01(id int);
insert into employee01 values(10),(20),(null),(30);
-- count(*) => no of rows count karega aur null value bhi count karega
select id,id+5 from employee01;

-- appply constraint
create table employee02(id int not null);
insert into employee02 values(10),(20);
insert into employee02 values(null);
select id,id+5 from employee01;

-- apply defuault constraint
drop table employee02;
create table employee02(id int , salary int default 0);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(20,null);
select * from employee02;

-- Apply unique constraint unique value mein same value nahi hoti
-- par null values de sakte hai..
-- unique multiple null values ko handle kar sakta hai AUR STORE BHI KAR PAYENGE..
-- par multiple duplicate values ko handle nahi kar sakta hai aur nahi store kAR PAYENGE
drop table employee02;
create table employee02(id int , salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(20,1002);
insert into employee02(id,salary) values(22,null);
select * from employee02;

-- Apply primary key constraint => they not take null values and contain unique value
-- not contain duplicate values
drop table employee02;
create table employee02(id int primary key , salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(null,1002);
insert into employee02(id,salary) values(10,null);
select * from employee02;

-- how to take constraint name
drop table employee02;
create table employee02(id int primary key , fname varchar(20),
salary int,
constraint regex_emp_salary_uk unique (salary));
insert into employee02 values(10,'a',99),(20,'b',99);

-- Question..
-- create student table sid ,sname, fee ,college name ,phno
-- sid ,sname should primary key fee cannot be notnull
-- the college default value should be
-- phno unique constraint
-- constraint name for each and every value

-- Solve
USE test1;

CREATE TABLE student (
  sid INT, 
  sname VARCHAR(30), 

  fee INT NOT NULL,
  college VARCHAR(30) DEFAULT 'regex',
  phone_no BIGINT,  -- Changed INT to BIGINT for better handling of phone numbers
  CONSTRAINT pk_student PRIMARY KEY (sid, sname),  -- Fixed column name from student_id to sid
  CONSTRAINT uq_phone UNIQUE (phone_no)  -- Fixed column name from phone to phone_no
);

select * from student;




-- what is normailzation ant tpes of normalization
-- what are acid properties and what are its usage
-- read about corelated subquery