/*
create table student_result(
rollno varchar2(3),
sub1 number(3),
sub2 number(3),
sub3 number(3),
total number(3),
percent number(4,2),
result varchar2(15)
);
*/
declare
	m_roll_no student_result.rollno%type;
	m_sub1 student_result.sub1%type := 0; 
	m_sub2 student_result.sub2%type := 0; 
	m_sub3 student_result.sub3%type := 0;
	m_total student_result.total%type := 0;
	m_percent student_result.percent%type := 0;
	m_result student_result.result%type;
begin
	m_roll_no := &m_roll_no;
	m_sub1 := &m_sub1;
	m_sub2 := &m_sub2;
	m_sub3 := &m_sub3;

	m_total := m_sub1 + m_sub2 + m_sub3 ;
	m_percent := m_total / 3;

	if m_sub1 >= 35 and m_sub2 >= 35 and m_sub3 >= 35 then
		if m_percent >= 70 and m_percent <= 100 then
			m_result := 'Distinction';
		elsif m_percent >= 60 and m_percent < 70 then
			m_result := 'First Class';
		elsif m_percent >= 50 and m_percent < 60 then
			m_result := 'Second Class';
		elsif m_percent >= 35 and m_percent < 50 then
			m_result := 'Pass Class';
		else
			m_result := 'Fail';
		end if;
	else
		 m_result := 'Fail';
	end if;
	insert into student_result
	values( m_roll_no, m_sub1, m_sub2, m_sub3, m_total, m_percent, m_result );
end;
/
