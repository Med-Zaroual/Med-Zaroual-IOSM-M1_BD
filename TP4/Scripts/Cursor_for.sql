declare 

vNum_operation budget.num_operation%type;
v_solde budget.solde%type;

begin

select max(num_operation) into vNum_operation from budget;
select solde into v_solde from budget where num_operation=vNum_operation;

insert into budget values(vNum_operation+1,"courses","debit",
"14/01/2002",500,v_solde-500);

end;h
/


ex2:

create table courses (num_operation number(4,2)Primary key,
nom_operation varchar(20),categorie varchar(20),
date_operation date,montant Number(4.2));

declare
cursor curseur is select * from budget where nom_operation="Courses";
begin
	for ligne in curseur loop
		insert into courses values (ligne.num_operation,ligne.nom_operation,
		ligne.categorie,ligne.date_operation,ligne.montant);
	end loop;
end;
/

Ex3:

create table budget_euro (num_operation number(4,2)Primary key,
nom_operation varchar(20),categorie varchar(20),
date_operation date,montant Number(4.2),solde number(7,2));
declare

cursor curseur is select * from budget where date_operation>"01/01/2002";
begin
for ligne in curseur loop
	insert into budget_euro values(ligne.num_operation,ligne.nom_operation
		ligne.categorie,ligne.date_operation,ligne.montant*11,
		ligne.solde);
end loop;
end;
/



















