
create or replace procedure affiche_emp
	is
	cursor curseur is select ename,job,deptno from emp;
	v_ename emp.ename%type;
	v_job emp.job%type;
	v_deptno emp.deptno%type;

	begin
	open curseur;
	fetch curseur into v_ename,v_job,v_deptno;
	while curseur %found loop
		dbms_output.put_line('l employe '|| v_ename || 'a la profession '|| v_job ||' dans le dept '|| get_dept(v_deptno));
		fetch curseur into v_ename,v_job,v_deptno;
	end loop;
	close curseur;
end;
/