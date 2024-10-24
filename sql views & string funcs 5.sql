#views - is a child table or virtual table created from parent table to hide details of parent table
use qadbt;

select * from company;

#Creating view containing google info
create view google_info as
select * from company where name='google';
select * from google_info;

#get the company names of having employees more than average
#findind average
create view comp_empl_avg as
select * from company group by name having employees > (select avg(employees) from company);
select * from comp_empl_avg;

#String Functions

#concat
select name,concat(name,branch) as nb from company;

#substring
select substr(name,8) from company where name = 'qaclickacademy';
select substr(name, 2,11) from company where name = 'qaclickacademy';

#replace 
select replace(name,'y','b') from company where name ='yahoo';

#length
select name,length(name) from company group by name;

#trim
select trim(' sampath ');

#limit
select * from company limit 3;










