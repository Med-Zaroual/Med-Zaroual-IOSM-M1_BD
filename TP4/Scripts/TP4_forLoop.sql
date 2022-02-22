ex1_1

create or replace function get_dept(num IN dept.deptno%type) return dept.dname%type
	is
	v_dname dept.dname%type;
	begin
	select dname into v_dname from dept where deptno=num;
	return(v_dname);
	end;
/

Ex1_2

create or replace procedure affiche_dept(num IN dept.deptno%type,nom dept.dname%type)
	is
	begin 
	select dname into nom from dept where deptno=num;
	dbms_output.put_line('le nom du dept est: '| nom);
	end;
/

Ex2_1:

create or replace procedure affiche_emp
	is
	cursor c is select ename,job,deptno from emp;
	begin
	for ligne in c loop
		dbms_output.put_line('lemploye '||ligne.ename||'a la profession'||ligne.job||'dans le dept'||get_dept(ligne.deptno));
	end loop;
	end;
/

Ex2_2:

create or replace function get_emp(num IN emp.empno%type) return emp.ename%type;
	is
	v_ename emp.ename%type;
	begin
	select ename into v_ename from emp where empno=num;
	dbms_output.put_line(v_ename);
	return (v_ename);
	end;
/

Ex3 :
create or replace function get_chef(num emp.empno%type) return emp.ename%type;
	is
	v_chef emp.mgr%type;
	e exception 
	begin
	select mgr into v_chef from emp where empno=num;
	if (v_chef is null) then raise e
	else
	return (get_emp(v_chef));

	EXCEPTION
	when e then
		dbms_output.put_line("aucun");

	end;
/

ex4 :

create or replace procedure aug_sal
	is 
	cursor c is select e.empno,e.sal,s.grade from emp e,salgrade s where e.sal between s.losal and s.hisal;
	v_emp emp.empno%type;
	v_sal emp.sal%type;
	v_grade salgrade.grade%type

	begin
	open c;
	fetch c into v_emp,v_sal,v_grade;
	while c %found loop
		if(v_grade=1 or v_grade=2) then
			update emp set sal=v_sal*1.1 where empno=v_emp;
		elsif(v_grade=3) then
			update emp set sal=v_sal*1.15 where empno=v_emp;
		else
			update emp set sal=v_sal*1.12 where empno=v_emp;
		end if;
	fetch c into v_emp,v_sal,v_grade;
	end loop;
close c;
end;
/

Ex5:

create or replace package gestion_emp is 
	function get_dept(num IN dept.deptno%type) return dept.dname%type;
	function get_emp(num IN emp.empno%type) return emp.ename%type;
	procedure affiche_dept(num IN dept.deptno%type,nom dept.dname%type);
	procedure affiche_emp;
	

end get_emp;












