/*
create table emp(
empno number(3),
ename varchar2(10),
salary number(8,2)
);
insert into emp
values(101,'rekha',10000);
insert into emp
values(102,'rajesh',12000);
insert into emp
values(103,'ramesh',9000);
*/

declare
	m_avg_salary emp.salary%type;
begin
	savepoint no_updates;

	update emp
	set salary = salary + 2500
	where ename = 'rekha';
	
	update emp
	set salary = salary + 2000
	where ename = 'rajesh';
	dbms_output.put_line('Salaries updates..');

	select avg(salary) into m_avg_salary from emp;
	
	if m_avg_salary > 12000 then
		dbms_output.put_line('aborting updates....');
		rollback to savepoint no_updates;
	end if;
	
	commit;
end;
/
