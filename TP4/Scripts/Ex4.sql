create or replace procedure aug_sal
	is
	cursor curseur is select e.sal,s.grade from emp e,salgrade s where e.sal between s.losal and s.hisal for update;
	v_sal emp.sal%type;
	v_grade salgrade.grade%type;

	begin
	open curseur;
	fetch curseur into v_sal,v_grade;
	while curseur %found loop
		if (v_grade=1 or v_grade=2) then
			v_sal:=v_sal+v_sal*0.1;
		elseif (v_grade=3) then
			v_sal:=v_sal+v_sal*0.15;
		else
			v_sal:=v_sal+v_sal*0.2;
		end if;
		update emp set sal=v_sal where current of curseur;
	fetch curseur into v_sal,v_grade;
	end loop;
	close curseur;
end;
/

