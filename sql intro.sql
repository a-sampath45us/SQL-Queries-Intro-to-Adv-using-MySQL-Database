#creating database
create database QADBT;
#pointing sql editor to a particula database to perform operations
use QADBT;

#creating tables
create table Employeeinfo(name varchar(20),id int,location varchar(20),age int);

#Schema of the table
describe Employeeinfo;

#inserting records(rows) into a table
insert into Employeeinfo values('sam',1,'vja',27);
insert into Employeeinfo values('swe',2,'twn',35);
insert into Employeeinfo values('sas',3,'nan',29);
insert into Employeeinfo values('pri',4,'lep',23);
insert into Employeeinfo values('sim',5,'imp',24);

#retrieving records from the table
select name,id,location,age from Employeeinfo;
select name,age from Employeeinfo;
select * from Employeeinfo;

#adding new column into existing table #alter is for altering table schema(column fields) not values(rows)
alter table Employeeinfo add gender varchar(10);
#modifying gender varchar(10) to gender varchar(20)
alter table Employeeinfo modify gender varchar(20);
#deleting column field in a table
alter table Employeeinfo drop gender;

#adding values in a newly added column field in a table
alter table Employeeinfo add gender varchar(10);
select * from Employeeinfo;
update Employeeinfo set gender='male' where name='sam';
update Employeeinfo set gender='female' where name='swe'; 
update Employeeinfo set gender='female' where name='sas';
update Employeeinfo set gender='female' where name='pri';
update Employeeinfo set gender='female' where name='sim';

#deleting a row in a table
insert into Employeeinfo values('yas',6,'luc',28,'female');
delete from Employeeinfo where name='yas';

#deleting table and database
create database sample;
use sample;
create table demo(id int);
drop table demo;
drop database sample;
















