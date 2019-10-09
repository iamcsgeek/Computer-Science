create or replace package body trans_mgmt as 
	-- Procedure definition
	procedure p_transaction( p_acc_no varchar2, p_trans_type char, p_trans_amt number ) is
	m_balance account.balance%type;
	"more than balance" Exception;
begin
	select balance into m_balance from account where acc_no = p_acc_no;
	if p_trans_type = 'd' then
		dbms_output.put_line('Rs. '|| p_trans_amt || ' deposited successfully.');
	elsif p_trans_type = 'w' then
		if p_trans_amt > m_balance then
			raise "more than balance";
		else
			dbms_output.put_line('Rs. '|| p_trans_amt || ' withdraw successfully.');
		end if;
	else
		dbms_output.put_line('Invalid Transaction Type.');
	end if;	
exception
	when "more than balance" then
		dbms_output.put_line('Attempted to withdraw more than Current Balance.');
end;
	-- Function Definition
function f_check_accno( p_acc_no in varchar2) return number is
	m_acc_no account.acc_no%type;
begin
	select acc_no into m_acc_no from account WHERE acc_no = p_acc_no;
	RETURN 1;
exception
	when no_data_found then
	RETURN 0;
end;
end trans_mgmt;
/

