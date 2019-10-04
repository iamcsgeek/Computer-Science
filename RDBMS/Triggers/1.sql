/*
Creating a trigger that checks the validity of a batchcode before a row is 
inserted in the batch table. (batchcode must be of length 5.)
*/
create table batch(
batchcode number(5) primary key,
batchdate date,
qty number(3)
);

create or replace trigger batch_ins_trg1
before insert on batch
for each row 
DECLARE
    ccode number(2);
BEGIN
    if length(:new.batchcode)!= 5 then 
        raise_application_error(-20110,'Invalid length for batch code');
    end if;
END;
/