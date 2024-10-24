#select pulls out column field from a table
#from points out to a table name
#where is a condition
use qadbt;
select * from employeeinfo;

#unique names in a table
insert into employeeinfo values('yas',6,'mpi',30,'female');
insert into employeeinfo values('yas',7,'mpi',30,'female');
select distinct name from employeeinfo;

#get employees name in vja
select name from employeeinfo where location='vja';

#get employees name in vja where there age should be more than 23
select name from employeeinfo where location='vja' and age>23;

#get employees name in vja where there age should be more than 23 or location is from imp
select name from employeeinfo where (location='vja'and age>23) or location='imp';

select name from employeeinfo where id=1 or id=5;

#print employee names of age between 24 & 27(IN is multiple ORs)(small quantity) 
select name from employeeinfo where age in(24,25,26,27);
select name from employeeinfo where location in('vja','imp');

#print employee names of age between 20 & 40 (large quantity)(between is and)
select name from employeeinfo where age between 20 and 40;

#print the employee names of age less than 25 (multiple ways below)
#where age<25
#age in(1,2,...25)
#age between 0 and 25
#and also another way negatively using NOT *****
select name from employeeinfo where age not between 25 and 100;

#Used in Regular expressions % _ (Wild Cards % _)
# % any no of letters - abcde ---> a%
# _ underscore stands for any single letter abcde---> _b%

use world;
select * from city;

#print country codes starts with letter 'A'
select distinct CountryCode from city where CountryCode like 'A%'; 

#print names of cities where country code ends with 'T'
select Name,CountryCode from city where CountryCode like '__T';

#SORT ---> order by 
# print city table in asc & desc order by city name
select * from city order by name;
select * from city order by name desc;










