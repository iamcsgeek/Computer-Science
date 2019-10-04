/*
    Create a trigger that allows Insertion operation for course code 10.
*/

create table course(
coursecode number(2) primary key,
course_name varchar2(20)
);

create or replace trigger t_bca_adm
before insert or update or delete on course 
for each row 
when (new.coursecode=10)
BEGIN
    if inserting or updating or deleting then 
        if :new.coursecode != 10 then 
            raise_application_error('DML Operation allowed only for Coursecode 10. ');
        end if;
    end if;
END;
/