use sakila;
select * from payment;
select sum(amount) from payment;
select count(amount) from payment;
select avg(amount) from payment;

select distinct(amount) from payment;  #=> distinct give unique values

select count(distinct(amount)),count (amount)=0 from payment

-- count gives not a value when a column are null so they not calculate the value for example
select count(amount) from  payment 
where amount=2.99;

-- groupby jis column par use kara hai toh apan usi pe use  kar sakte hai apart of dusre column ke 

select amount , count(payment_id),sum(amount),avg(amount) from payment group by amount;

-- payment_id,payment date,amount 

select * from payment;

select month(payment_date) from payment;

select month(payment_date) from payment group by month(payment_date);

-- get total amount and avg amount spend by each customer;
-- get total amount and the max and min amount for each staff id
-- get the total no of payment done by each staff
-- get the total amount total no entries and the avg amount and max amount by each customer where the amount should greater then 2 dollar and payment id should 
-- greater then 10

-- solve 1
select customer_id , sum(amount) ,avg(amount) from payment group by customer_id; 

-- solve 2
select * from payment;
select sum(amount), max(amount) ,min(amount) from payment group by amount;

-- aggregate function ke sath where clause nahi lagta hai
-- having clause use for aggregate funtion 
-- 
-- solve 3
select staff_id ,count(amount)


select amount, sum(amount) from payment 
where amount>5
group by amount
having sum(amount)>5000;

-- order by
-- alias

select amount , amount*10 as `select` from payment;

select * from payment order by amount desc,rental_id desc;

-- subquery
-- condition
-- case statement(if elsif statement use)

-- condition? True :FALSE
select amount,if(amount=0.99, 'correct','incorrect') from payment;

select amount,if(amount=0.99, 'correct', if(amount=2.99,'yes','incorrect')) from payment;

-- select col,
--  case
--   when condition then statement
--   when condition then statement
--  end
 
 select amount,
 case
   when amount=0.99 then 'value is 0.99'
   when amount=2.99 then 'yes'
   else amount
end as cond
from payment;

-- if the count of payemnt done for each amount is greater then 10000 so print we have amiount is greatre then 10000
-- else less than 10000

-- if the amount is greater then 1 dollar, if amount is greater then 3 dollar , if the amount is greater then 7 dollar 
-- else less then 1 dollar
select * from payment;

-- case 1 solve
 select amount,
 case
   when count(amount)>=1000 then 'we have amount is grater then 10000'
  -- when count(amount)<10000 then 'we have amount is less then 10000'
   else 'we have amount is less then 1000'
end as new 
from payment group by(amount);

-- case 2 solve..
-- if the amount is greater then 1 dollar, if amount is greater then 3 dollar , if the amount is greater then 7 dollar 
-- else less then 1 dollar

 select amount,
 case
   when count(amount)>=1 and amount<=3 then 'amount is greater then 1 dollar'
    when count(amount)>=3 and amount<=7 then 'amount is greater then 3 dollar'
   when count(amount)>=7 then 'amount is greater then 7 dollar'
   else 'less then 1 dollar'
end as new 
from payment group by(amount);


-- sub query..
select * from payment where 
amount=(select amount from payment where payment_id=3)


-- what are keys and its usage
-- types of realationship in sql
-- primary ,candidate, super and foreign key
