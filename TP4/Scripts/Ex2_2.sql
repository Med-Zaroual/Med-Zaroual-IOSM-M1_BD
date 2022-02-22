create or replace function get_emp(num in emp.empno%type)

	return emp.ename%type

	is

	v_ename emp.ename%type;

	begin

	select ename into v_ename from emp where empno=num;

	dbms_output.put_line('le nom de l employe: ' || v_ename);

	return (v_ename);
end;
/


