drop table parent;
create table parent(
did int primary key,
dname char
);
drop table child;
create table child(
eid int primary key,
ename varchar2(10),
did int references parent(did) on delete cascade
);

insert into parent
values(1,'A');
insert into parent
values(2,'B');

insert into child
values(1,'ratan',1);
insert into child
values(2,'niraj',2);
insert into child
values(3,'ayush',1);
insert into child
values(4,'mac',2);
insert into child
values(5,'jayesh',1);
/*
delete from parent where did=2;
select * from parent;
select * from child;
*/
