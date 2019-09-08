select d.dept_name, e.ename from empl e, dept d where (d.dept_name, e.salary ) in (
select d.dept_name, max(e.salary) from empl e, dept d 
where e.dept_no = d.dept_no 
group by d.dept_name); 
