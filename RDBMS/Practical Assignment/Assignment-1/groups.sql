/*
drop table sales;
create table sales(
id int,
city varchar2(20),
month varchar2(15),
sales_amt number(10,2)
);

insert into sales
values(1,'mumbai','april',12500000);
insert into sales
values(2,'ahmedabad','april',6500000);
insert into sales
values(3,'pune','april',8500000);
insert into sales
values(4,'mumbai','august',23000000);
insert into sales
values(5,'ahmedabad','august',11500000);
insert into sales
values(6,'pune','august',11000000);
insert into sales
values(7,'mumbai','december',11000000);
insert into sales
values(8,'ahmedabad','december',9000000);
insert into sales
values(9,'pune','december',7500000);
*/

-- Citywise Groups
--select city, sum(sales_amt) from sales group by city; 

-- Monthwise Groups
--select month, sum(sales_amt) from sales group by month;

-- City and Monthwise Grouping
--select city, month, sum(sales_amt) from sales group by city, month;

-- Having Clause
--select city, sum(sales_amt) from sales group by city having sum(sales_amt) > 40000000; 

-- ROLL UP operator
--select city, month, sum(sales_amt) from sales group by rollup (city, month); 

-- CUBE Operator
--select city, month, sum(sales_amt) from sales group by cube(city, month) order by city, month;
