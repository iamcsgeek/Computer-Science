declare
	m_acc_no account.acc_no%type;
	m_balance account.balance%type;
	m_status account.status%type;
begin
	m_acc_no := '&m_acc_no';
	
	if f_check_accno(m_acc_no) = 1 then
		SELECT balance, status INTO m_balance, m_status from account
		WHERE acc_no = m_acc_no;
		dbms_output.put_line('Account Balance : ' || m_balance);
		dbms_output.put_line('Account Status : ' || m_status);
	else
		dbms_output.put_line('Account Not Exist.');
	end if;
end;
/
