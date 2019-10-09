declare
	cursor c_exam is select rno, sub1, sub2, sub3 from exam;
	m_rno exam.rno%type;
	m_sub1 exam.sub1%type;
	m_sub2 exam.sub2%type;
	m_sub3 exam.sub3%type;
	m_total result.total%type;
	m_percent result.percent%type;
begin
	open c_exam;
	if c_exam%ISOPEN then
		loop
			fetch c_exam into m_rno, m_sub1, m_sub2, m_sub3;
			exit when c_exam%notfound;
			if c_exam%found then
				m_total := m_sub1 + m_sub2 + m_sub3;
				m_percent := m_total / 3;
				insert into result
				values( m_rno, m_total, m_percent );
			end if;
		end loop;
	else
		dbms_output.put_line('Unable to Open Cursor');
	end if;
	close c_exam;
end;
/
