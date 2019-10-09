/*
create table rate(
year number,
interest number,
amount number
);
*/

declare
	int_rate constant number := 7;
	m_year number := 1;
	m_principal number;
	m_duration number;
	m_interest number;
	m_amount number;

begin
	m_principal := &m_principal;
	m_duration := &m_duration;
	m_amount := m_principal;

	while m_year <= m_duration
	loop
		m_interest := (m_amount * int_rate * 1)/100;
		m_amount := m_amount + m_interest;

		insert into rate
		values( m_year,round(m_interest,2),round(m_amount,2));
		
		m_year := m_year + 1;
	end loop;
end;
/
