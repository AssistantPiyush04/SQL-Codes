-- Joins=> ek ya ek se jyada table ko jodne ke liye
-- consistency
-- null nahi ani chahiye

use sakila;
select * from address;

create database test1;
use test1;

create table products(pid int, name varchar(20), price int);
insert into products values(10,'tv',100),(20,'apple',200),
(30,'mobile',300),(40,'shoe',1500);

select * from products;

create table orders(oid varchar(20), city varchar(20),
product_id int);
insert into orders values('A1012','Jaipur',10),
('B21012','Goa',20), ('C3012','Japan',30),('D4012','uK',60);
select * from orders;


select pid , name , price,city
from product join orders;

-- join jaha pe commmon element nikle dono column ke
select pid , name , price,city
from product join orders
where pid= product_id;

-- these is same but write sequence way is these and it is best..
select pid , name , price,city
from product join orders
where p.pid= o.product_id;

select p.pid , p.name , p.price, o.city
from product as p inner join orders as o   -- inner join mein on or where nahi likhenge.
on p.pid= o.product_id;

-- left join 
select p.pid , p.name , p.price, o.city
from product as p left join orders as o   
on p.pid= o.product_id;

-- right join 
select p.pid , p.name , p.price, o.city
from product as p right join orders as o   
on p.pid= o.product_id;

-- non-equi join 
select p.pid , p.city
from product as p right join orders as o   
on p.pid= o.product_id;
 
 
-- insert into orders values ('E212','jk',10)

-- natural join
-- select p.pid,p.name