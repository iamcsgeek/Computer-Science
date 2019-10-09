
create table categories(
category_id varchar2(3) primary key,
category_name varchar2(25)
);
create table services(
service_id varchar2(3),
category_id varchar2(3) references category(category_id),
service_name varchar2(25),
gst_rate number(4,2)
);

insert into categories
values('c01','cugs');
insert into categories
values('c02','sgss1');
insert into categories
values('c03','sgss2');
insert into categories
values('c04','scgs');

insert into services
values('s01','c01','Edible oil',0);
insert into services
values('s02','c02','Railway Reservation',0);
insert into services
values('s03','c03','Internet Connection',0);
insert into services
values('s04','c04','Car Purchase',0);



DECLARE
	m_category_id categories.category_id%type;
	cursor c_categories IS
        select category_id, category_name from categories;

        cursor c_services(p_category_id categories.category_id%type) IS
        select service_id, service_name, gst_rate from services; 
BEGIN
	for c in c_categories
	loop
	        m_category_id := c.category_id;
	        for s in c_services(m_category_id)
	        loop
	            if c.category_name = 'cugs' then
	                update services
	                set gst_rate = 5
	                where category_id = m_category_id;
	            elsif c.category_name = 'sgss1' then 
	                update services
	                set gst_rate = 12
	                where category_id = m_category_id;
	            elsif c.category_name = 'sgss2' then 
	                update services
	                set gst_rate = 18
	                where category_id = m_category_id;
	            elsif c.category_name = 'scgs' then 
	                update services
	                set gst_rate = 28
	                where category_id = m_category_id;
	            end if;
	        end loop;
        end loop;
END;
/

create or replace trigger t_gst
before update of gst_rate on services
for each row when (new.gst_rate > 0)

BEGIN
    if updating then 
        raise_application_error(-20101,'GST Rates can not be Updated.');
    end if;
END;
/

