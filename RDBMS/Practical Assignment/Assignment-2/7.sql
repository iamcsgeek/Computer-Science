
create table department(
    department_id varchar2(3) primary key,
    dname varchar2(15)
);
insert into department
values('d01','java');
insert into department
values('d02','.net');

create table employee(
    employee_id varchar2(3) primary key,
    ename varchar2(10),
    salary number(8,2),
    department_id varchar2(3) references department(department_id)
);
insert into employee
values('e01','sujan',50000,'d01');
insert into employee
values('e02','neha',45000,'d02');
insert into employee
values('e03','pravin',55000,'d02');
insert into employee
values('e04','aarti',55000,'d01');

create table emp_raise(
    empraise_id int primary key,
    employee_id varchar2(3),
    raise_date date,
    raise_amount number(8,2)   
);


DECLARE
	m_department_id department.department_id%type;

	cursor c_department IS
        select department_id, dname from department where dname='java';

        cursor c_employee(p_department_id department.department_id%type) IS
        select employee_id, ename, salary from employee where department_id = p_department_id; 
BEGIN
	for c in c_department
	loop
	        m_department_id := c.department_id;		
	        for s in c_employee(m_department_id)
	        loop
	            update employee
			set salary = salary + (salary*0.20)
				where employee_id = s.employee_id; 
	        end loop;
        end loop;
	dbms_output.put_line('Raise 20% salary to Java Department');
EXCEPTION
	when no_data_found then
		dbms_output.put_line('No Employee Found');	
END;
/




create sequence s_empraise_id increment by 1 start with 1;

create or replace trigger t_raise
after update of salary on employee
for each row when (new.department_id = 'd01' and old.salary < new.salary) 
DECLARE
	m_raise_amt emp_raise.raise_amount%type;
BEGIN
	m_raise_amt := :new.salary - :old.salary;
    if updating then 
        insert into emp_raise
        values(s_empraise_id.nextval, :old.employee_id, sysdate, m_raise_amt);
    end if;
END;
/ 

