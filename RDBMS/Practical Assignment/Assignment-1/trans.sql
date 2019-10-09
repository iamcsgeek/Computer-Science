/*
create sequence seq_trans
increment by 1 start with 1;

create table transaction(
trans_id number,
trans_type char(2),
acc_no varchar2(3) references account(acc_no),
trans_amt number(8,2),
trans_date date
);
*/


declare
	m_trans_type char;
	m_trans_amt account.balance%type;
	m_acc_no account.acc_no%type;
	m_payee_acc account.acc_no%type;
	m_balance account.balance%type;
	m_min_balance constant number(7,2) := 2500 ;
begin
	m_acc_no := '&m_acc_no';
	m_trans_type := '&m_trans_type';
	m_trans_amt := &m_trans_amt;	
	
	select balance into m_balance from account where acc_no = m_acc_no;

	if m_trans_type = 'd' then
		update account
		set balance = balance + m_trans_amt 
		where acc_no = m_acc_no;

		insert into transaction
		values(seq_trans.nextval, m_trans_type, m_acc_no, m_trans_amt, current_date); 
		dbms_output.put_line('Transaction Successful.');
	elsif m_trans_type = 'w' then
		if m_balance < m_min_balance and m_balance < m_trans_amt then
			dbms_output.put_line('Insuffiecient Balance');
		else
			savepoint no_withdraw;
			update account
			set balance = balance - m_trans_amt 
			where acc_no = m_acc_no;
		end if;

		select balance into m_balance from account
		where acc_no = m_acc_no;

		insert into transaction
		values(seq_trans.nextval, m_trans_type, m_acc_no, m_trans_amt, current_date);

		if m_balance < m_min_balance then
			dbms_output.put_line('Transaction Rollback....'); 
			rollback to savepoint no_withdraw;
		else
			dbms_output.put_line('Transaction Successful.');
		end if;
	elsif m_trans_type = 't' then
		m_payee_acc := '&m_payee_acc';
		select acc_no into m_payee_acc from account 
		where acc_no = m_payee_acc;

		update account set balance = balance - m_trans_amt
		where acc_no = m_acc_no;
		insert into transaction
		values(seq_trans.nextval, 'tw', m_acc_no, m_trans_amt, current_date);
		
		update account set balance = balance + m_trans_amt
		where acc_no = m_payee_acc;
		insert into transaction
		values(seq_trans.nextval, 'td', m_payee_acc, m_trans_amt, current_date);
		dbms_output.put_line('Transfer Successfully Completed.');
	else
		dbms_output.put_line('Invalid Operation');
	end if;	
	commit;		
end;
/

