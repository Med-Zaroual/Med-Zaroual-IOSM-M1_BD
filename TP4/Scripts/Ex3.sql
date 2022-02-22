create or replace function get_chef(num emp.empno%type)
	return emp.ename%type

	is

	v_chef emp.mgr%type;

	begin 

	select mgr into v_chef from emp where empno=num;

	if v_chef is null then
		return ('aucun');
	else
		return (get_emp(v_chef));
	end if;
end;
/