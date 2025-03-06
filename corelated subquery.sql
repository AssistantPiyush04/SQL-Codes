use regex1;
show tables;

create table emp(eid int primary key, name varchar(20));
insert into emp values(1,"aman"),(2,"Shubham"),(3,"Mahesh");

create table emp_family(eid int, name varchar(20),father varchar(20));

insert into emp_family values(1,"aman","raj"),(2,"Shubham","Kamal"),(3,"abc","aman"),(4,"Ujwall","ramesh");
select * from emp_family;


-- for comparision row by row then we use corelated subquery
select * from emp
where name in(select father from emp_family
 where emp_family.eid=emp.eid);
 
 -- question..
 -- create table and these data
 -- empid =>pk
 -- fname,salary,dpt_id
 -- i need to get emp_id the first name dept_id and salary 
 -- only for that employee where the salary of the emp should 
 -- greater then  the avg salary of that dept
 
 create table emp123(empid int primary key,fname varchar(20),
 salary int(20),dpt_id int);
 
 insert into emp123 values(1,"tushar",900,10),(2,"Shubham",100,10),
 (3,"aman",50,10),(4,"sakshi",200,11),(5,"naina",300,11);
 select * from emp123;
 
 select * from emp123 where
 salary > (select avg(salary) from emp123 as e
  where emp123.dpt_id=e.dpt_id
  group by e.dpt_id);
 
select * from emp123
where (dpt_id,salary)in(
select e.dpt_id,avg(salary) from emp123 as e
  group by e.dpt_id);
  
create table product1(pro_id int(10),prod_name varchar(20));
insert into product1 values(1,"dove"),(2,"salt"),(3,"sugar");

create table order1(ord_id int(10),ord_name varchar(20));
insert into order1 values(4,"sirf"),(5,"colgate"),(6,"soap");

-- exists operator
SELECT ord_name
FROM order1
WHERE EXISTS (SELECT prod_name FROM product1 WHERE 
prod_.ord_id = order1.ord_id AND ord_id < 5);

