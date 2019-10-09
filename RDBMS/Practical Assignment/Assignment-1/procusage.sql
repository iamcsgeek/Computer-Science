declare
	m_trans_type char;
	m_trans_amt account.balance%type;
	m_acc_no account.acc_no%type;
begin
	m_acc_no := '&m_acc_no';
	m_trans_type := '&m_trans_type';
	m_trans_amt := &m_trans_amt;
	
	--Function Call
	if f_check_accno( m_acc_no ) = 1 then
		-- Procedure
		p_transaction( m_acc_no, m_trans_type, m_trans_amt );
	else
		dbms_output.put_line('Account not Exist.');
	end if;	
end;
/
