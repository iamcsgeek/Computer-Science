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

begin
	
	FOR no_trans_rec IN c_no_trans
	loop	
		UPDATE account SET status ='inactive' WHERE acc_no = no_trans_rec.acc_no;
		INSERT INTO inactive_account 
		values(no_trans_rec.acc_no, current_date);			
	end loop;
	COMMIT;
end;
/
