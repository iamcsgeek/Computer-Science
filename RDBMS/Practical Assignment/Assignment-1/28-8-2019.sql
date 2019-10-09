create or replace procedure print_result( p_rno int ) as
	m_percent number(4,2);
begin
	select getpercentbyrno(p_rno) into m_percent from student2 where rno = p_rno;
	if m_percent >= 70 then
		dbms_output.put_line('First Class with Distinction');
	end if;	
end;
/
