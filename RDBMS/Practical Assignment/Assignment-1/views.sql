-- Readonly View
create view pune_sales as select * from sales where city = 'pune' with read only;

-- Updateble View
create view pune_sales as select * from sales where city = 'pune' with check option;
-- OR 
create view pune_sales as select * from sales where city = 'pune';
