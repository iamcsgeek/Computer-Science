/*
    Create a trigger that allows no DML operations on enquiry table to be performed
    on any weekday, but allows only insertion on Sunday.
*/
create or replace trigger t_enquiry2
before insert or update or delete on enquiry
DECLARE
    uname varchar(30);
BEGIN
    select user into uname from dual;
    if inserting then 
        if to_char(sysdate,'Day') != 'sunday' then 
            raise_application_error(-20111,'Insertion not allows on Sunday');
        end if;
    end if;
    if updating or deleting then 
        raise_application_error(-20112,'Updation and Deletion is not allowed. ');
    end if;
END;