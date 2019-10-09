create or replace package pkg_student as
	procedure print_result( p_rno int );
	function getpercentbyrno( p_rno int ) return number;
	no_stud constant number := 100;
end pkg_student;
/

