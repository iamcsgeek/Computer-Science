/*
create or replace package body pkg_student as
	procedure print_result( p_rno int ) as
		m_percent number(4,2);
	begin
		select getpercentbyrno(p_rno) into m_percent from student2 where rno = p_rno;
		if m_percent >= 70 then
			dbms_output.put_line('First Class with Distinction');
		end if;	
	end;
	trigger student_audit
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
	function getpercentbyrno( p_rno int ) return number is
		m_percent number;
	begin
		select percent into m_percent from student2 where rno = p_rno;
		return m_percent;
	exception
		when no_data_found then
		return 0;
end;

end pkg_student;
/
*/
