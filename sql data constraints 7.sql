#SQL Constraints - constraints are used to limit the type of data that can go into a table
use qadbt;

# Not Null Constraint - It will not allow Null value in a column
create table constab(flightname varchar(20), flightid int not null);
describe constab;
insert into constab values('abcd',null); #this will throw error
drop table constab;

#Default Constraint - it will provide a default value to a column when the INSERT INTO statement does not provide a specific value
create table constab1(name varchar(20), age int default 25);
insert into constab1 (name) values('abcd');
select * from constab1;
drop table constab1;

#Unique Constraint - it ensures that all values in a column are distinct
create table constab2(name varchar(20), id int unique);
insert into constab2 (name,id) values('abcd',21);
insert into constab2 (name,id) values('def',21);
drop table constab2;

#Check Constraint - it ensures that all values in a column satisfy certain conditions. we can insert a row or update a row only if it satisfies check constraint
#MySQL doesn't support
#syntax - create table constab2(name varchar(20), id int check(id)>25);

#Primary Key Constraint - it is used to uniquely identify each row in a table. Primary Key can't be null and has to be unique.
create table empdb(empid int, name varchar(20), branch varchar(20), primary key(empid));

#Foreign Key - is a column/columns that references a column(most often the primary key) of another table. the purpose of the foreign key is to ensure referential integrity of the data
create table customerdetails(customerid int, address varchar(20), zipcode int, primary key(customerid));

create table orderdetails(orderid int, customerid int, amount int, date varchar(20), primary key(orderid), foreign key(customerid) references customerdetails(customerid));
#foreign key is for only if we are a customer(through signup) we can place an order. after we submit the order it confirms order only if we exists in customers table
#and also if we want to delete customer record first we have to delete his orderdetails then only we can delete customer record

insert into customerdetails values(123,'abcd','30097');
select * from customerdetails;

insert into orderdetails values(111, 123, 100,'13 sep');
select * from orderdetails;

insert into orderdetails values(112, 1234, 1000,'13 sep'); #this throws an error

delete from customerdetails where customerid=123; #throws an error

delete from orderdetails where customerid=123;
delete from customerdetails where customerid=123;

drop table customerdetails;
drop table orderdetails;


#On Delete Cascade - it is used to delete parent record and its dependent child records(foreign keys) at a time automatically. above we did manually first delete child record and then parent records
create table customerdetails(customerid int, address varchar(20), zipcode int, primary key(customerid));
create table orderdetails(orderid int, customerid int, amount int, date varchar(20), primary key(orderid), foreign key(customerid) references customerdetails(customerid) on delete cascade);

insert into customerdetails values(123,'abcd','30097');
insert into orderdetails values(111, 123, 100,'13 sep');

select * from customerdetails;
select * from orderdetails;

delete from customerdetails where customerid=123;

drop table customerdetails;
drop table orderdetails;



