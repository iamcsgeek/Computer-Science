create table student(
rollno number(3) primary key,
name varchar2(15),
stream varchar2(15),
year number(3)
semester number(3),
percentage number(4,2)
);

create table toppers(
rollno number(3),
name varchar2(15),
stream varchar2(15),
year number(3),
semester number(4,2)
);

insert into student
values(101,'rahul','computer',1,1,70.50);
insert into student
values(102,'mehul','computer',1,1,66.20);

insert into student
values(111,'neha','commerce',1,1,70.50);
insert into student
values(112,'sunil','commerce',1,1,66.20);

insert into student
values(201,'rajesh','computer',2,3,75.30);
insert into student
values(202,'snehal','computer',2,3,72.20);




