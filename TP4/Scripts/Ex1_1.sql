
create or replace function get_dept(num IN dept.deptno%type)

	return dept.dname%type

	is

	v_dname dept.dname%type;

	begin

	select dname into v_dname from dept where deptno=num;

	return (v_dname);

end;
/

