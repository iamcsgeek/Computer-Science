/*
    Create a trigger that implement update cascade functionality using Trigger. 
*/
create table parent(
a int primary key,
b int 
);
insert into parent
values(1,2);
insert into parent
values(2,4);

create table child(
a int references parent(a),
c int 
);

insert into child
values(1,8);
insert into child
values(1,10);
insert into child
values(2,7);

create or replace trigger t_update_cascade
after update on parent
for each row 
BEGIN
    update child
    set a = :new.a 
    where a = :old.a ;
END;

-- Check effects
select * from parent;
select * from child;