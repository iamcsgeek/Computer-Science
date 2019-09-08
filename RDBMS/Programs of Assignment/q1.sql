/*
create table employee(
empno varchar2(5) primary key,
emp_name varchar2(15),
date_of_birth date,
address varchar2(15),
city varchar2(15)
);
create table salary(
emp_no varchar2(5) references employee(empno),
basic number(8,2),
da number(8,2),
hra number(8,2),
tax number(8,2),
gross number(8,2),
net number(8,2)
);

insert into employee
values('e01','sunil gupta','21-JUL-86','worli','mumbai');
insert into employee
values('e02','rajesh patil','15-OCT-88','hadapsar','pune');
insert into employee
values('e03','miraj shah','10-JAN-85','kurla','mumbai');

insert into salary
values('e01',10000,5000,2000,500,17000,16500);
insert into salary
values('e02',12000,6000,3000,500,21000,20500);
insert into salary
values('e03',11000,5500,2500,500,18000,18500);
*/

/*
create or replace procedure calc_salary(p_emp_no salary.emp_no%type) is
	m_increment constant number := 0.11;
	m_new_gross salary.gross%type;
	m_basic salary.basic%type;
	m_new_basic salary.basic%type;
	m_new_net salary.net%type;
	m_da salary.da%type;
	m_hra salary.hra%type;
	m_tax salary.tax%type;
begin
	select basic, da, hra, tax into m_basic, m_da, m_hra, m_tax from salary where emp_no = p_emp_no;
	m_new_basic := m_basic * 0.11 ;
	m_new_gross := m_basic + m_new_basic + m_da + m_hra ;
	m_new_net := m_new_gross - m_tax;
	dbms_output.put_line('After 11% raise in Basic Salary ');
	dbms_output.put_line('Gross Salary :' || m_new_gross );
	dbms_output.put_line('Net Salary :' || m_new_net );
exception
	when no_data_found then
		dbms_output.put_line('Employee No. not Found');	
end;
/
*/

create or replace trigger t_emp 
