use sakila;

select * from payment;

select max(amount) from payment
where amount < (select max(amount) from payment);

-- DDL Statements..
-- Data defination language
-- with data

-- DML => inserting, update, delete..

use mydb;
create table regex(id int, name varchar(20));
insert into regex values(1,'Piyush');
insert into regex(name) values('tushar');
select * from regex;

-- CTAS(create table as select).. only data is copy not constraint copy..
create table y3 as select actor_id,first_name
from sakila.actor;
select * from y3;

-- only data is copy not constraint c
desc y3;

create table y4 as select actor_id as Act_id,first_name as name
from sakila.actor;
select * from y4;

-- delete (DML)
select * from y4;
delete from y4 where Act_id in(2,4);
select * from y4;

-- Update(DML)..
update y4 set name='Piyush' where Act_id=3; 
select * from y4;

-- DML=>create ,insert,delete..
-- DDL=> drop ,truncate..
-- drop=> delete full table..
drop table y3;
select * from y3;

create table y5 as select actor_id, first_name
from sakila.actor;
select * from y5;

-- truncate=> delete all rows
truncate table y5;
select * from y5;

-- THEORY..
-- delete is very slower because they delete row by row.
-- drop is faster then delete but slower then truncate..
-- delete and truncate mein structure rehta hai 
-- delete can be rollback means changes vapas la sakte hain

-- alter=> related to structure work have been done by alter..

create table companies(id int);
insert into companies values(10);
select * from companies;

desc companies;
-- alter=> related to structure work have been done by alter..
-- syntax of alter => add table columns
alter table companies
add column phone varchar(15);

select * from companies;
desc companies;

alter table companies
add column employee_count3 int NOT NULL;

select * from companies;
-- alter with drop..
alter table companies drop column employee_count3;
select * from companies;

-- rename..
RENAME table companies to newcompany1;
    select * from companies;
    select * from newcompany1;

-- Alter with Rename..
alter table newcompany1 rename to companies;
select * from companies;

alter table companies
rename column phone to company_name;
select * from companies;

update companies set company_name="tushar" where id=9;
desc companies;

alter table companies add primary key(id);
desc companies;

alter table companies add constraint UNIQUE key(company_name);
desc companies;

alter table companies drop constraint company_name;
desc companies;

alter table companies modify company_name int;

-- 0 1 2 3 5 6 8