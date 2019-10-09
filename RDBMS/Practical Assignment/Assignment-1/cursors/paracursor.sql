/*
create table new_branch(
branch_no varchar2(3),
branch_name varchar2(20)
);

insert into new_branch
values('b04','pandesara');
insert into new_branch
values('b05','bhatar');
insert into new_branch
values('b06','udhna');
insert into new_branch
values('b07','varachha');
insert into new_branch
values('b08','bhagal');
insert into new_branch
values('b09','katargam');
insert into new_branch
values('b10','vesu');
*/


declare
	CURSOR c_branch IS
	SELECT * FROM new_branch;

	CURSOR c_chk_branch(m_branch_name varchar2) IS
	SELECT branch_no FROM branch WHERE branch_name = m_branch_name;

	m_branch_no branch.branch_no%type;
	m_branch_name branch.branch_name%type;
	mast_ins_view varchar2(10);
begin
	open c_branch;
	loop
		FETCH c_branch INTO m_branch_no, m_branch_name;
		EXIT WHEN c_branch%NOTFOUND;
		
		OPEN c_chk_branch(m_branch_name);
		FETCH c_chk_branch INTO mast_ins_view;
		
		if c_chk_branch%FOUND then
			dbms_output.put_line('Branch ' || m_branch_name || ' already exist.');
		else
			dbms_output.put_line('Branch ' || m_branch_name || ' does not exist.');
			dbms_output.put_line('Inserting New Branch' || m_branch_name || ' to the database.');
			INSERT INTO branch
			values(m_branch_no, m_branch_name );
		end if;
		CLOSE c_chk_branch;
	end loop;
	CLOSE c_branch;
	COMMIT;
end;
/

