/*
Create a trigger which does not allow any DML operations over the enquiry table,
if the user is student
*/


create table enquiry(
enquiry_id number(5) primary key,
subject varchar2(50),
contact_no varchar2(10),
enquiry_date date
);

create or replace trigger t_enquiry
before insert or update or delete on enquiry
DECLARE
    uname varchar(30);
BEGIN
    select user into uname from dual;
    if uname='student' then 
        raise_application_error(-20110,'Invalid Insertion');
    end if;
END;
/