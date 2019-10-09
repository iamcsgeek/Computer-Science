create table customer(
cno varchar2(3) primary key,
cname varchar2(15),
city varchar2(15)
);
create table branch(
bno varchar2(3) primary key,
bname varchar2(15),
city varchar2(15)
);
create table deposit(
actno varchar2(3) primary key,
cno varchar2(3) references customer(cno),
bno varchar2(3) references branch(bno),
amt number(9,2),
adate date
);
create table borrow(
loanno varchar2(3),
cno varchar2(3) references customer(cno),
bno varchar2(3) references brnach(bno),
amt number(9,2)
);

/*
1. Give the names of customer having the same living city as their branch city.
*/
select c.cname from customer c, branch b where c.city = b.city;

/*
2. Give the names of depositers having the same branch as the branch of sunil.  
*/
select c.cname from customer c, branch b, deposit d 
where c.cno = d.cno and d.bno = b.bno and b.bno = (
select b.bno from customer c, branch b, deposit d 
where c.cno = d.cno and d.bno = b.bno and c.cname = 'sunil');

/*
3. Display the branch cities of 'anil' and 'sunil';
*/
select b.city from customer c, branch b, deposit d 
where c.cno = d.cno and d.bno = b.bno and c.cname in ('sunil','anil');

/*
4. Display the total loan taken from Surat branch. 
*/
select sum(b.amt) from borrow bo, branch br
where br.bno = bo.bno and br.city = 'surat';

/*
5. Give name of Customers having more deposit then the average deposit in
their respective branches. 
*/
select c.cname from customer c, deposit d, branch b 
where c.cno = d.cno and d.bno = b.bno 
group by b.bname having d.amt > (
    select avg(d.amt) from deposit d, 
) 

/*
    Write a function which display the customer name whose loan amount fall
    between a given range. 
*/
create or replace procedure getCustomerByLoan( p_start borrow.amt%type,
                                              p_end borrow.amt%type ) as
    cursor customers is
    select c.cname from customer c, borrow b 
    where c.cno = b.cno and b.amt between p_start and p_end; 
begin 
    for cust in customers
    loop
        dbms_output.put_line('Customer Name : ' || cust.cname);
    end loop;
end;
/

/*
    Write a database trigger, which will not allow any transaction after bank
    office hours and on sunday.   
*/
create or replace trigger tr_trans
before insert or update or delete on customer, borrow, branch, deposit 
DECLARE

BEGIN
    if inserting or updating or deleting then 
        m_current_day = to_char(sysdate,'Day'); 
        if(  m_current_day = 'sunday') then 
            raise_application_error(-20111,'Transaction is not allowed on Sunday');
        end if;
        m_current_time = to_char(sysdate,'HH');
        if (m_current_time < 10 and m_current_time > 17) then 
            raise_application_error(-20112,'Transaction is allows only in Banking Hours [10 am-5pm]');
        end if;
    end if;
END;
/