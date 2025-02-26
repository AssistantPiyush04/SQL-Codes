-- Self Join..
-- A Self Join in SQL is a powerful technique that allows one to join a table with itself
-- This operation is helpful when you need to compare rows within the same table
-- based on specific conditions.
-- Simple means=> When a table match with it's own table..

-- How to use self join..

use test1;
select * from staff;

alter table staff
rename column manage_id to
manager_id;

select emp.eid, emp.ename, emp.manager_id, mng.ename
from staff as emp join staff as mng
where emp.manager_id=mng.eid;

-- Set Operator..
-- using operator in set is
-- 

-- union is append the query 
use sakila;
select * from actor where actor_id in (2,3)
union
select * from actor where actor_id in (3,5);

-- union
select * from actor where actor_id in (2,3)
union
select first_name,actor_id,last_name,last_update
 from actor where actor_id in (3,5);
 
 -- union all
select * from actor where actor_id in (2,3)
union all
select * from actor where actor_id in (3,5);
 
 -- except means=> a set operator in SQL that returns the distinct rows that are present in the result set of the first query
 -- but not in the result set of the second query.
 
 -- except in hindi => ek aise row ya aisa column jo first mein hai par dusre query mein nahiho
 
 select * from actor where actor_id in (2,3)
except
select * from actor where actor_id in (3,5);

select * from actor ;
select * from film_actor ;
desc actor;
desc film_actor;

-- Join Both tables actor and film_actor..
select actor.actor_id,first_name,film_id
from actor join film_actor
where actor.actor_id=film_actor.actor_id;

-- find which actor_id do how many movies..
select actor.actor_id,count(film_actor.film_id) as movies
from actor join film_actor
where actor.actor_id=film_actor.actor_id
group by actor.actor_id order by movies desc;

-- About datatypes in sql..
-- 


