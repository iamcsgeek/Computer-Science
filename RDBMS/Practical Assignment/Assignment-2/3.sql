create table customer(
cust_id number(3) primary key,
cust_name varchar2(20),
cust_address varchar2(20),
cust_phone varchar2(10)
);
insert into customer
values();

create table bank(
b_id number(3) primary key,
b_name varchar2(15),
b_address varchar2(15),
b_phone varchar2(15)
);

create table loan(
l_id number(3) primary key,
l_type varchar2(15) check( l_type in ('home','car','personal','education')),
l_amount number(8,2),
b_id number(3) references bank(b_id),
cust_id number(3) references customer(cust_id)
);

/*
    1. Find out Customer details who has taken a 'personal' loan.
*/
select c.* from customer c, loan l 
where c.cust_id = l.cust_id and l_type = 'personal';

/*
    2. Find out Customer who has taken loan from 'ICICI' Bank.
*/
select c.* from customer c, bank b, loan l
where c.cust_id = l.cust_id and l.b_id = b.b_id and b.b_name='icici';


/*
    3. Total_loan_amount from each loan type using group by.
*/
select l_type, sum(l_amount) from loan group by l_type;


create or replace procedure getloandetails( p_cust_id in customer.cust_id%type,
                                            o_cust_name out customer.cust_name%type,
                                            o_b_name out bank.bank_name%type,
                                            o_l_type out loan.l_type%type,
                                            o_l_amt out loan.l_amount%type )
 BEGIN
    select c.cust_name into o_cust_name, 
    b.b_name into o_b_name, 
    l.l_type into o_l_type,
    l.l_amount into o_l_amt
    from customer c, bank b, loan l 
    where c.cust_id = l.cust_id and l.b_id = b.b_id and c.cust_id = p_cust_id;
 END;
 /          

 create or replace trigger loan_settlement
 after delete on customer(cust_id)
 for each statement 
 
 BEGIN
    if deleting THEN
        delete from laon where cust_id = :old.cust_id;
    end if;
 END;
 /                                 