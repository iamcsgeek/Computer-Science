declare
	cursor c_exam2 is select rno, sub1, sub2, sub3 from exam;
	m_total result.total%type;
	m_percent result.percent%type;
begin
	for exam_rec in c_exam2
	loop	
		m_total := exam_rec.sub1 + exam_rec.sub2 + exam_rec.sub3;
		m_percent := m_total / 3;
		insert into result
		values( exam_rec.rno, m_total, m_percent );
	end loop;
	commit;
end;
/
