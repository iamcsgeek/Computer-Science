declare
	-- Declare User-defined Exception for I/O Validations
	"resource busy" EXCEPTION;
	PRAGMA EXCEPTION_INIT("resource busy",-30006); 

	-- Memory Variables
	m_acc_no account.acc_no%type;
	m_trans_type char(2);
	m_trans_amt account.balance%type;
	m_acc_balance number(8,2);
begin
	m_acc_no := '&m_acc_no';
	m_trans_type := '&m_trans_type';
	m_trans_amt := &m_trans_amt;

	SELECT balance INTO m_acc_balance FROM account
	WHERE acc_no = m_acc_no FOR UPDATE WAIT 10;

	if m_trans_type = 'd' then
		UPDATE account
		SET balance = balance + m_trans_amt
		WHERE acc_no = m_acc_no;
	elsif m_trans_type = 'w' then
		UPDATE account
		SET balance = balance - m_trans_amt
		WHERE acc_no = m_acc_no;
	end if;

EXCEPTION
	WHEN "resource busy" then
		dbms_output.put_line('The Account is in Use. Please Try Later...');
end;
/
