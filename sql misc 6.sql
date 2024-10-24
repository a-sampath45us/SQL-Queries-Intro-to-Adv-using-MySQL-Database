#Union, Union All, Intersect, Exists, Case
use qadbt;
create table college(id int, name varchar(20));
insert into college values(53,'tim');
insert into college values(643,'ben');
insert into college values(223,'tam');
insert into college values(574,'sam');
insert into college values(422,'ram');
insert into college values(983,'joe');
insert into college values(5399,'ten');
insert into college values(5399,'ten');
insert into college values(574, Null);
insert into college values(5399,'ten');
insert into college values(57545,'sam');
insert into college values(98003,'joepp');

delete from college where name = '';

create table results(id int, name varchar(20));

insert into results values(9893,'tina');
insert into results values(53,'tim');
insert into results values(24,'harsh');
insert into results values(223,'tam');
insert into results values(575459,'sam');
insert into results values(887,'jack');
insert into results values(5444,'ten');
insert into results values(98003,'joepp');

select * from college;
select * from results;

#Union - merging two tables removing duplicates and maintaining unique records
select * from college union (select * from results);

#Union All - merging two tables after merging it may duplicates also (merging tables as is) 
select * from college union all (select * from results);

#Intersect(common records) - subquery gets all ids present in results table - main query checks ids from subquery exists in college table or not 
select * from college where id in (select id from results);

#Exists 
#Query1 they want details of complete college
#Query2 if the person belongs to specific college
#if Q2 is true then it executes Q1
#if Q2 is false then stops executing Q1
# to execute one query based upon condition(t or f) of another query
select * from college where exists (select * from college where name='ram');

create table marks(score int, name varchar(20));

insert into marks values(45,'tina');
insert into marks values(23,'tim');
insert into marks values(64,'harsh');
insert into marks values(65,'tam');
insert into marks values(98,'sam');
insert into marks values(34,'jack');

select * from marks;

#Case - manipulates values of a table on runtime gives a new table(original table will not change) - gives a new column on runtime on a case condition
select name, score, case name
when 'tim' then score*2
when 'sam' then score-25
when 'tina' then score*3
when 'harsh' then 'sjjkd'
else score
end
'newscore' from marks;















