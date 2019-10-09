/*
create table audit_emp(
eid number,
ename varchar2(15),
design varchar2(20),
salary number(8,2),
operation varchar2(7),
userid varchar2(10),
oper_date date
);
*/


create or replace trigger audit_trail
after insert or update or delete on sample_emp
for each row
declare
	oper varchar2(8);
begin
	if inserting then
		oper := 'insert';
	end if;
	if updating then
		oper := 'update';
	end if;
	if deleting then
		oper := 'delete';
	end if;
	insert into audit_emp
	values(:old.eid, :old.ename, :old.design, :old.salary, oper, sysdate, user);
end;
/
