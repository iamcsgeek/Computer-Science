/*
create table customer(
cust_no number(3) primary key,
balance number(8,2)
);

insert into customer
values(101,1500);
insert into customer
values(102,2500);
insert into customer
values(103,2000);
*/


declare
	m_cust_no customer.cust_no%type;
	m_balance customer.balance%type;
	min_balance constant number := 500;
begin
	m_cust_no := &m_cust_no;
	
	update customer
	set balance = balance - 1000
	where cust_no = m_cust_no;

	dbms_output.put_line('Rs. 1000 Deducted from Customer No. :' || m_cust_no);

	select balance into m_balance from customer where cust_no = m_cust_no;

	if m_balance <= min_balance then
		dbms_output.put_line('Not Enough Balance.....aborting transaction...');
	end if;
end;
/


