/*
create table inactive_account(
acc_no varchar2(3) references account(acc_no),
inactive_date date
);
*/
declare
	-- Cursor Declaration	
	CURSOR c_no_trans IS
	SELECT acc_no, status FROM account 
	WHERE acc_no NOT IN ( SELECT DISTINCT acc_no from transaction GROUP BY acc_no );

	-- Memory Variable Declaration
	m_acc_no account.acc_no%type;
	m_status account.status%type;
begin
	
	OPEN c_no_trans;
	if c_no_trans%ISOPEN then
		loop
			FETCH c_no_trans INTO m_acc_no, m_status;
			exit when c_no_trans%NOTFOUND;

			if c_no_trans%FOUND then
				UPDATE account SET status ='inactive' 
				WHERE acc_no = m_acc_no;

				INSERT INTO inactive_account
				values(m_acc_no, current_date);			
			end if;
		
		end loop;
		COMMIT;
	else
		dbms_output.put_line('Unable to Open Cursor.');		
	end if;
	close c_no_trans;
end;
/
