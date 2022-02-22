
create or replace procedure affiche_dept(num IN dept.deptno%type,nom OUT dept.dname%type)
	is
	begin 

	select dname into nom from dept where deptno=num;
	
	dbms_output.put_line('le nom de departement ' || nom);

end;
/


