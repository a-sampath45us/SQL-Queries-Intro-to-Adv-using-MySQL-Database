use qadbt;
create table citizenloc(name varchar(50),loaction varchar(50));
insert into citizenloc values('rahul','california');
insert into citizenloc values('george','california');
insert into citizenloc values('flex','texas');
insert into citizenloc values('steve','california');
insert into citizenloc values('husain','chicago');
insert into citizenloc values('subash','florida');

create table citizens(name varchar(50),age int, exp int);
insert into citizens values('rahul',34,6);
insert into citizens values('subash',34,6);
insert into citizens values('george',41,10);
insert into citizens values('flex',23,15);
insert into citizens values('husain',10,0);
insert into citizens values('steve',24,7);

select * from citizenloc;
select * from citizens;

#what is the age of people located in texas
select name,age from citizens where name=(select name from citizenloc where loaction='texas');

#experience of people located in chicago
select name,exp from citizens where name=(select name from citizenloc where loaction='chicago');

#what is the age of people located in california
select name,age from citizens where name in(select name from citizenloc where loaction='california');

#when subqueries returning only one result use equal operator (where name=)
#when subqueries returning multiple results use in operator (where name in)
#name is common column field between two tables so using it after where( where name =)
#subquery executes first and main query executes next

#name & location of the persons whose age is 41
select name,loaction from citizenloc where name=(select name from citizens where age=41);

#SQL JOINS (Inner Join or Join)
#here we are joining both tables using JOINS
#here we are trying above examples using joins in a single query(main query) without using subqueries
#below joined two tables printed out name,age & location
select c.name,cl.loaction,c.age from citizens as c join citizenloc as cl on c.name=cl.name;

#what is the age of people located in california
select c.name,cl.loaction,c.age from citizens as c join citizenloc as cl on c.name=cl.name where cl.loaction="california";

create table established(name varchar(50), year int);
insert into established values('qaclickacademy',2010);
insert into established values('google',1990);
insert into established values('yahoo',1992);
insert into established values('facebook',1992);

create table company(name varchar(50),branch varchar(50),employees int);
insert into company values('qaclickacademy','us','20');
insert into company values('google','us','500');
insert into company values('yahoo','canada','250');
insert into company values('google','india','400');
insert into company values('qaclickacademy','india','75');
insert into company values('qaclickacademy','uk','10');
insert into company values('qaclickacademy','canada','30');
insert into company values('yahoo','us','200');
insert into company values('yahoo','india','150');
insert into company values('facebook','us','50');

select * from established;
select * from company;

#need total employees count of a company which is established in a year 1990
select c.name,sum(c.employees) from established as e join company as c on e.name=c.name where e.year=1990 group by c.name;

#min employees present in a branch for all companies established after 1990
select c.name,e.year,min(c.employees) from established as e join company as c on e.name=c.name group by c.name having e.year>1990;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

#SQL Left Join & Right Join
create table student(name varchar(50),id int,age int, gender varchar(50),location varchar(50));
insert into student values('sai',1,12,'female','spain');
insert into student values('baba',2,15,'female','newyork');
insert into student values('ram',3,15,'female','spain');
insert into student values('raghu',4,15,'female','newyork');
insert into student values('ajay',5,12,'female','nijeria');
insert into student values('matrhru',6,12,'female','spain');

create table grades(grade varchar(10), id int);
insert into grades values('A',2);
insert into grades values('B',3);
insert into grades values('A',4);
insert into grades values('C',5);
insert into grades values('B',7);

#Join or Inner Join - Returns records that have matching values in both tables
#left Join - Returns all records from the left table, and the matched records from the right table
#Right Join - Returns all records from the right table, and the matched records from the left table

#Get the student details of RO with results who passed in exams - Join or Inner Join
select s.name,s.id,s.gender,s.age,g.grade from student as s join grades as g on s.id = g.id;
#other ways of writing join
select s.name,s.id,s.gender,s.age,g.grade from student s join grades g on s.id = g.id;
select s.name,s.id,s.gender,s.age,g.grade from student s, grades g where s.id = g.id;

#Get the student details of RO with result who appeared in the exams - Left Join
select s.name,s.id,s.gender,s.age,g.grade from student as s left join grades as g on s.id = g.id;

#Get the all student details with results who passed in exams - Right Join
select s.name,s.id,s.gender,s.age,g.grade from student as s right join grades as g on s.id = g.id;

#Get the female student details of RO with results who passed in exams - Join or Inner Join
select s.name,s.id,s.gender,s.age,g.grade from student as s join grades as g on s.id = g.id where s.gender='female';

#Get the male student details of RO with result who appeared in the exams - Left Join
select s.name,s.id,s.gender,s.age,g.grade from student as s left join grades as g on s.id = g.id where s.gender='male';

#Get the all student details whose age > 12 with results who passed in exams - Right Join
select s.name,s.id,s.gender,s.age,g.grade from student as s right join grades as g on s.id = g.id where s.age>12;








