/*
create table stock_mstr(
productId varchar2(3) primary key,
status char(2),
mfgdate date,
price number(6,2),
type varchar2(10),
best_before number(3)
);

create table inactv_stock_mstr(
expId number(3) primary key,
productId varchar2(3) references stock_mstr(productId),
mfgdate date,
type varchar2(10)
);


create sequence seq_expId start with 1 increment by 1;

insert into stock_mstr
values('p01','a','15-SEP-18',300,'food',12);
insert into stock_mstr
values('p02','a','12-JUN-18',600,'medicine',24);
insert into stock_mstr
values('p03','a','1-AUG-17',250,'medicine',18);
insert into stock_mstr
values('p04','a','25-DEC-16',150,'food',36);
insert into stock_mstr
values('p05','a','18-APR-15',275,'food',36);
*/
/*
create or replace function f_isexpire(p_prodId stock_mstr.productId%type) return number is
	m_best_before stock_mstr.mfgdate%type;
begin
	select to_date(add_months(mfgdate, best_before)) into m_best_before from stock_mstr
	where productId = p_prodId; 
	
	if m_best_before > sysdate then
		return 0;
	elsif m_best_before <= sysdate then
		return 1;
	end if;
exception
	when no_data_found then
		return -1;
	
end;
/
*/

/*
declare
	cursor c_stocks is
	select productId, status, mfgdate, type from stock_mstr;

	m_productId stock_mstr.productId%type;
	m_status stock_mstr.status%type;
	m_mfgdate stock_mstr.mfgdate%type;
	m_type stock_mstr.type%type; 
	m_best_before stock_mstr.best_before%type;
begin
	open c_stocks;
	if c_stocks%ISOPEN then
		loop
			fetch c_stocks into m_productId, m_status, m_mfgdate, m_type;
			exit when c_stocks%notfound;
			if c_stocks%found then
				if f_isexpire(m_productId) = 1 then
					update stock_mstr
					set status = 'i'
					where productId = m_productId;

					insert into inactv_stock_mstr
					values(
						seq_expId.nextval,
						m_productId, m_mfgdate, m_type );  
				end if; 
			end if;
		end loop;
	else
		dbms_output.put_line('Unable to open Cursor.');
	end if;

end;
/
*/
