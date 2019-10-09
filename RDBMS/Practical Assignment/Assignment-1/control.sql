-- Demo of If-Else Statement

declare
	a number := 5;
	b number := 4;
	c number := 3;
begin
	if a > b then
		if a > c then
			dbms_output.put_line('A is greatest number.');
		else
			dbms_output.put_line('C is greatest number.');
		end if;	
	else
		if b > c then
			dbms_output.put_line('B is greatest number.');
		else
			dbms_output.put_line('C is greatest number.');
		end if;
	end if; 	
end;
/


-- Demo of If-ElsIf-Else Statement
/*
declare
	percent number ;
begin
	percent := &percent;

	if percent >= 70 then
		dbms_output.put_line('First Class with Distionction');
	elsif percent >= 60 and percent < 70 then
		dbms_output.put_line('First Class');
	elsif percent >= 50 and percent < 60 then
		dbms_output.put_line('Second Class');
	elsif percent >= 35 and percent < 50 then
		dbms_output.put_line('Pass Class');
	else
		dbms_output.put_line('Fail');
	end if;
end;
/
*/
-- Demo of Simple Loop
/*
declare
	i number := 0;
begin
	loop
		dbms_output.put_line('Value of i : ' || i );
		i := i + 2;
	exit when i > 10;
	end loop;
	dbms_output.put_line('Exit when i becomes '|| i);
end;
/
*/
-- Demo of While Loop
/*
declare
	i number := 0;
begin
	while i <= 10
	loop
		dbms_output.put_line('Value of i : ' || i );
		i := i + 2;	
	end loop;
	dbms_output.put_line('Exit when i becomes '|| i);
end;
/
*/


-- Demo of For Loop-forward
/*
declare
begin
	for i in 1..10
	loop
		dbms_output.put_line('Value of i : ' || i );
	end loop;
	
end;
/
*/
/*
-- Demo of For Loop -reverse
declare
begin
	for i in reverse 1..10
	loop
		dbms_output.put_line('Value of i : ' || i );
	end loop;
	
end;
/
*/
