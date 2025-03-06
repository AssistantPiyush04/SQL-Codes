use employees;
select * from employees;
select * from departments;
select * from salaries;

select * from salaries 
where salary> all
(select salary from salaries where emp_no=10003)
 order by salary desc;
 
 select * from titles;
 select * from employees;
desc titles;
desc employees;

select emp_no,first_name,last_name,title
from employees join titles using(emp_no)
where emp_no=110085;

select emp_no,first_name,last_name,title
from employees join titles using(emp_no)
where title!="Manager"
and emp_no=Any(select) emp_no;

-- join part here
select distinct emp_no, first_name, last_name
from employees join titles mgr using(emp_no)
join titles nonmgr using(emp_no)
where mgr.title='Manager'
And nonmgr.title <> 'Manager';

-- i neeed to get hire daTE IS LESS THEIR HIRING DATE OF THE CURRENT IN MANAGER POST

select emp_no, first_name, last_name ,hire_date  from employees
join titles using(emp_no)
where title='Assistant Engineer'
and emp_no=Any(select emp_no from employees)
join titles using;

-- from the titles table get the employee no of the position
-- of the number and the year of the hiring date from the 
-- current date of position where the pereson have been promoted  

select * from titles;
SELECT e.emp_no, YEAR(e.from_date) AS fd from titles
where title='Manager'
and (emp_no, year(from_date))IN
(select emp_no, year(from_date) from titles
WHERE title <>'Manager');

-- 1.) single row subquery mein sare opewrator use kare sakte haiobn'
-- 2.) single row multivalue(multiplerowsubquery)=> iske liye in ,=any operator lagate hain
-- =all nahi chalta 
-- multicolumnsubquery mein any all nahi lagata hain in hi lagat ahin