/*
create table account(
acc_no varchar2(3) primary key,
balance number(8,2)
);
*/

/*
insert into account
values('101',2000);
insert into account
values('102',5000);
insert into account
values('103',10000);
insert into account
values('104',1500);
insert into account
values('105',3000);
*/
/*
create table penalty(
acc_no varchar2(3),
duration date
);
*/

declare
	------------------------ Declare Memory Variable Here -------------------
	m_acc_no account.acc_no%type;  -- datatype same as table's column
	m_balance account.balance%type; 
	min_balance constant number(7,2) := 2500 ; -- declaring constant
begin
	------------------------------ Business Logic ---------------------------
	-- Taking Input from User	
	m_acc_no := &m_acc_no;
	
	-- Store Table's Column value into Memory Variable
	select balance into m_balance from account where acc_no = m_acc_no;	
	
	if m_balance < min_balance then
		update account
		set balance = balance - 500
		where acc_no = m_acc_no;

		insert into penalty
		values(m_acc_no, current_date );
		-- Print Message
		dbms_output.put_line('Rs. 500 Debited from ' || m_acc_no || ' as Penalty');
	else
		dbms_output.put_line('Your Account is Safe for Transaction.');

	end if;
end;
/
