/*
create table menu(
item_id varchar2(3) primary key,
name varchar2(20),
price number(6,2),
category varchar2(15) check ( category in ('starter','vegetable','roti','rice','soup') )
);


create table tbl_order(
order_id varchar2(3),
item_id varchar2(3) references menu(item_id),
table_no varchar2(3),
qty number(3)
);


insert into menu
values('i01','veg65',120,'starter');
insert into menu
values('i02','pizza',110,'starter');
insert into menu
values('i03','veg nawabi',170,'vegetable');
insert into menu
values('i04','mix veg',130,'vegetable');
insert into menu
values('i05','tanduri roti',20,'roti');
insert into menu
values('i06','butter chapati',25,'roti');
insert into menu
values('i07','veg pulav',150,'rice');
insert into menu
values('i08','jira rice',120,'rice');
insert into menu
values('i09','veg soup',120,'soup');
insert into menu
values('i10','tomato soup',120,'soup');
*/

/*
insert into tbl_order
values('o01','i03','t01',1);
insert into tbl_order
values('o01','i05','t01',2);
insert into tbl_order
values('o02','i10','t02',1);
insert into tbl_order
values('o02','i01','t02',3);
insert into tbl_order
values('o02','i02','t02',1);
insert into tbl_order
values('o03','i02','t03',2);
insert into tbl_order
values('o04','i03','t04',1);
*/

/*
select name from menu where item_id in (
select item_id from tbl_order where qty > 1 );

*/

select o.order_id from tbl_order o, menu m
where o.item_id = m.item_id group by category having count(category) > 2;


/*
select table_no from tbl_order 
	where item_id = ( select item_id from menu 
		where price = (select max(price) from menu) );
*/
--select category, max(price) from menu group by category;


create or replace trigger t_qty
after update or insert on tbl_order
for each row

begin
	if updating then
		if :old.qty <= 0 THEN
			raise_application_error('Quantity of an item can not be zero');
		end if;
	end if;

	if inserting then
		if :new.qty <= 0 THEN
			raise_application_error('Quantity of an item can not be zero');
		end if;
	end if;
end;
/ 
