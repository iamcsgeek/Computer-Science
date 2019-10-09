declare
	rows_affected char(4);
	
begin
	update account
	set balance = balance - (balance * 0.05)
	where branch_no = '&branch_no';
	
	rows_affected := to_char(SQL%ROWCOUNT);
	
	if SQL%ROWCOUNT > 0 then
		dbms_output.put_line(rows_affected || ' Accounts updated Successfully.');
	end if;
end;
/
