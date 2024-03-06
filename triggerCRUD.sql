create database tiggers;

use tiggers;

create table table1(id int,name varchar(55),age int,branch varchar(55));
create table table2(id int,name varchar(55),age int,branch varchar(55));



create trigger insertvalues
on table1
after insert 
as
begin
	declare @a int,@b varchar(55),@c int,@d varchar(55);
	select @a=id,@b=name,@c=age,@d=branch from inserted;

	insert into table2(id,name,age,branch) values(@a,@b,@c,@d);
end;

insert into table1 values (2,'manoj',88,'mech');



create trigger updatevalue
on table1
after update
as
begin
	if update(age)
	begin
		declare @newage int,@name varchar(55);
		select @newage=age,@name=name from inserted;

		UPDATE table2
        SET age = @newage
        WHERE name = @name;
	end
end;


UPDATE table1 SET age = 55 WHERE name = 'tejas';




create trigger deletevalue
on table1
after delete
as
begin
	declare @name varchar(55);
	select @name=name from inserted;
	delete from table2 where @name=name;
end;

delete from table1 where name='manoj';



		


select * from table1;
select * from table2;