/*
create table student2(
rno int primary key,
name varchar2(15),
percent number(4,2)
);

insert into student2
values(1,'sunil mishra',68.20);
insert into student2
values(2,'mehul joshi',75.50);
insert into student2
values(3,'anil patil',62.80);


create table student_audit(
rno int,
name varchar2(15),
percent number(4,2),
db_oper varchar2(7),
db_user varchar2(10),
op_date date
);
*/

/*
-- Trigger
create or replace trigger student_audit
after update or delete on student2
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

	insert into student_audit
	values(:old.rno, :old.name, :old.percent, oper, user, sysdate );
end;
/
*/

/*
--Function
create or replace function getpercentbyrno( p_rno int ) return number is
	m_percent number;
begin
	select percent into m_percent from student2 where rno = p_rno;
	return m_percent;
exception
	when no_data_found then
	return 0;
end;
/
*/
