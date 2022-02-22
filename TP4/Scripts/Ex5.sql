create or replace package gestion_emp
	is
	function get_dept(num IN dept.deptno%type) return dept.dname%type;
	procedure affiche_dept(num IN dept.deptno%type,nom OUT dept.dname%type);
	procedure affiche_emp;
	function get_emp(num in emp.empno%type) return emp.ename%type;
	function get_chef(num emp.empno%type) return emp.ename%type;
	procedure aug_sal;
end gestion_emp;
/