
declare
	m_acc_no account.acc_no%type;
begin
	m_acc_no := '&m_acc_no';
	SELECT acc_no INTO m_acc_no FROM account WHERE acc_no = m_acc_no;
	if SQL%FOUND then
		dbms_output.put_line('Please Complete your KYC details.');
	end if;
exception
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('Account No. ' || m_acc_no ||' is not Present in Accounts');  
end;
/


