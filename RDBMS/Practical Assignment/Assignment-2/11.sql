/*
create table category(
category_id varchar2(3) primary key,
category_name varchar2(15)
);

create table product(
product_id varchar2(3) primary key,
category_id varchar2(3) references category(category_id),
product_name varchar2(20),
price number(8,2),
discount number(4,2)
);

create table audit_offer(
offer_id number(3) primary key,
category_id varchar2(3) 
product_id varchar2(3) 
old_price number(8,2),
discount number(4,2),
new_price number(8,2)
);


insert into category
values('c01','electronics');
insert into category
values('c02','sports');
insert into category
values('c03','fashion');
insert into category
values('c04','furniture');

*/
insert into product
values('p01','c01','mobile phone','15000',0);
insert into product
values('p02','c01','air conditioner','40000',0);
insert into product
values('p03','c02','indoor game set','25000',0);
insert into product
values('p04','c02','outdoor game set','45000',0);
insert into product
values('p05','c03','mens wear','1000',0);
insert into product
values('p06','c03','ladies wear','3000',0);
insert into product
values('p07','c04','dining table','5000',0);
insert into product
values('p08','c04','showcase','25000',0);


/*
    1. Apply 5% discount for the products belongs to "Electronics" Category. 
*/

declare 
	m_category_id category.category_id%type;
	m_category_name category.category_name%type;
	m_discount_rate product.discount%type;

    	cursor c_category is 
    	select category_id, category_name from category;

    	cursor c_product( p_category_id category.category_id%type) is  
    	select product_name, price, discount from product
	where category_id = p_category_id;
begin 
    for c in c_category
    loop 
        m_category_id := c.category_id;
	dbms_output.put_line('Processing ..... '|| c.category_name );
        for p in c_product(m_category_id)
        loop 
            if m_category_name = 'electronics' then 
		m_discount_rate := 5;
            elsif m_category_name = 'sports' then 
                m_discount_rate := 10;
            elsif m_category_name = 'fashion' then 
                m_discount_rate := 15;
            elsif m_category_name = 'furniture' then 
                m_discount_rate := 20;
            end if;
	    -- Updating Discount Rate
	    update product
                set discount = m_discount_rate
                	where product_id = p.product_id;
	    -- Apply Discount and Updating Price
            update product 
		set price = price + (price*(m_discount_rate/100))
			where product_id = p.product_id;		
        end loop;
    end loop;
end;
/
/*
create sequence s_offer_id increment by 1 start with 1;

create or replace trigger t_audit_offer
after update on product
for each row
begin
    if updating then
         insert into audit_offer
         values(s_offer_id.nextval, :old.category_id, :old.product_id, :old.price, :new.discount, :new.price);
    end if;
end;
/
*/

