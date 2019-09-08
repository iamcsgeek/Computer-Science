/*
create table act_mst(
acc_no number(3) primary key,
balance number(8,2)
);
create table trans_log(
acc_no number(3),
trans_type char(2),
trans_date date,
trans_amt number(8,2)
);

insert into act_mst
values(101,15000);
insert into act_mst
values(102,25000);
insert into act_mst
values(103,20000);
*/

create or replace trigger t_trans_log
after insert or update or delete on act_mst
for each row
declare
	m_trans_amt act_mst.balance%type;
	m_trans_type trans_log.trans_type%type;
begin
	if updating then
		m_trans_amt := abs(:old.balance - :new.balance);
		if :new.balance > :old.balance then
			m_trans_type := 'd';
		elsif :new.balance < :old.balance then
			m_trans_type := 'w';
		end if;

		insert into trans_log
		values(:old.acc_no, m_trans_type, current_date, m_trans_amt );  
	end if;
	
	if deleting then
		insert into trans_log
		values(:old.acc_no, 'x',current_date, :old.balance );
	end if;
	-- Not Detected...
	if inserting then
		insert into trans_log
		values(:new.acc_no,'n',current_date, :new.balance );
	end if;
end;
/
