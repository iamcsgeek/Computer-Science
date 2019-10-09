/*
create table branch(
branch_no varchar2(3) primary key,
branch_name varchar2(20)
);

create table account(
acc_no varchar2(3) primary key,
balance number(8,2),
status varchar2(10) check (status in ('active','inactive')),
branch_no varchar2(3) references branch(branch_no)
);


insert into branch
values('b01','udhna');
insert into branch
values('b02','athwagate');
insert into branch
values('b03','varachha');

insert into account
values('a01',75000,'active','b01');
insert into account
values('a02',25000,'active','b02');
insert into account
values('a03',5000,'active','b03');
insert into account
values('a04',175000,'active','b01');
insert into account
values('a05',10000,'active','b01');
insert into account
values('a06',300000,'active','b02');
insert into account
values('a07',67000,'active','b03');
insert into account
values('a08',35000,'active','b01');
insert into account
values('a09',150000,'active','b03');
insert into account
values('a10',7500,'active','b02');
*/

/*
begin
	update account
	set balance = &balance 
	where acc_no = '&acc_no';
	
	if SQL%FOUND then
		dbms_output.put_line('Balance Updated Successfully');
	end if;

	if SQL%NOTFOUND then
		dbms_output.put_line('Account Not Found.');
	end if;

end;
/
*/
