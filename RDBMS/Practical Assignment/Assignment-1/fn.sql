create or replace function f_check_accno( p_acc_no in varchar2) return number is
	m_acc_no account.acc_no%type;
begin
	select acc_no into m_acc_no from account WHERE acc_no = p_acc_no;
	RETURN 1;
exception
	when no_data_found then
	RETURN 0;
end;
/

-- Excercise - Create function that takes input as account no and return current balance.
