/*
create table dept(
dept_no number(3) primary key,
dept_name varchar2(10)
);

create table empl(
empno number(3) primary key,
ename varchar2(10),
salary number(8,2),
dept_no number(3) references dept(dept_no)
);

insert into dept
values(1,'admin');
insert into dept
values(2,'it');
insert into dept
values(3,'research');

insert into empl
values(101,'sachin',25000,1);
insert into empl
values(102,'mahesh',20000,1);
insert into empl
values(103,'vikram',20000,2);
insert into empl
values(104,'darshan',30000,2);
insert into empl
values(105,'jayesh',22000,2);
insert into empl
values(106,'ketan',23000,2);
insert into empl
values(107,'mukund',35000,3);
insert into empl
values(108,'nilesh',45000,3);
*/

/*
declare
	cursor c_dwmse is
	select d.dept_name, e.ename from empl e, dept d 
	where (d.dept_name, e.salary ) in (
		select d.dept_name, max(e.salary) from empl e, dept d 
		where e.dept_no = d.dept_no 
		group by d.dept_name); 
begin
	dbms_output.put_line('Department wise Highest Salaried Employees');
	for emp_rec in c_dwmse
	loop
		dbms_output.put_line('Department Name : ' || emp_rec.dept_name );
		dbms_output.put_line('Employee Name : ' || emp_rec.ename ); 
	end loop;
end;
/
*/

/*
create or replace function getdeptbyeid( p_empno empl.empno%type ) return varchar2 is
	m_dept_name dept.dept_name%type;
begin
	select d.dept_name into m_dept_name from empl e, dept d
	where e.dept_no = d.dept_no and e.empno = p_empno ;
	return m_dept_name;
exception
	when no_data_found then
		return null;
end;
/
*/


create table empl_log(
log_no number,
empno number(3),
ename varchar2(10),
salary number(8,2),
action varchar2(7)
);

/*
create sequence seq_log_empl increment by 1 start with 1;
*/

/*
create or replace trigger t_empl
after update or delete on empl
for each row
declare
	oper varchar2(7);
begin
	if updating then
		oper := 'update';
	end if;

	if deleting then
		oper := 'delete';
	end if;
	insert into empl_log
	values( seq_log_empl.nextval, :old.empno, :old.ename, :old.salary, oper );
end;
/
*/
