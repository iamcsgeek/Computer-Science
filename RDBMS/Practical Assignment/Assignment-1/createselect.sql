-- Same Column Names
create table emp_contacts as select emp_id, emp_name, address, address, email from employee;


-- OR

-- Renaming Column Names
create table emp_contacts(eid, ename, city,email) as 
select emp_id, emp_name, address, email from employee;
