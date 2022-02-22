create or replace procedure aug_sal
	is
	cursor curseur is select e.empno,e.sal,s.grade from emp e,salgrade s where e.sal between s.losal and s.hisal;
	
	v_sal emp.sal%type;
	v_grade salgrade.grade%type;
	v_empno emp.empno%type;

	begin
	open curseur;
	fetch curseur into v_empno,v_sal,v_grade;
	while curseur%found loop
		if (v_grade=1 or v_grade=2) then
			update emp set sal=v_sal*1.1 where empno=v_empno;
		elsif (v_grade=3) then
			update emp set sal=v_sal*1.15 where empno=v_empno;
		else
			update emp set sal=v_sal*1.2 where empno=v_empno;
		end if;
	fetch curseur into v_empno,v_sal,v_grade;
	end loop;
	close curseur;
end;
/

