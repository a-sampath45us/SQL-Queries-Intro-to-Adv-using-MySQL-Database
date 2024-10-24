use qadbt;
create table transactions(month varchar(50),day int,amount int,branch varchar(50));
describe transactions;
insert into transactions values('feb',13,124,'bangalore');
insert into transactions values('feb',17,20400,'chicago');
insert into transactions values('feb',212,320,'sydney');
insert into transactions values('mar',22,9600,'bangalore');
insert into transactions values('mar',16,5200,'chicago');
insert into transactions values('april',12,23,'sydney');
insert into transactions values('jan',13,666,'bangalore');
insert into transactions values('may',2,3111,'sydney');
insert into transactions values('may',1,99999,'paris');
insert into transactions values('jan',12,2000,'paris');

select * from transactions;

#Group By and Aggregate Functions

#get total sum of amount generated for each month
select month,sum(amount) from transactions group by month; 

#get maximum transaction generated for every month
select month,max(amount) from transactions group by month;

#get minimum transaction generated for every month
select month,min(amount) from transactions group by month;
select min(amount),branch from transactions group by branch;

#get average transaction generated for every month
select month,avg(amount) from transactions group by month;

#no of transactions occured for each month
select month,count(amount) from transactions group by month;

#get the transactions which occured less than 2 for any month
# 'having' is used to put a condition on a group by
# condition on table, 'where'
#condition on group by results table, 'having'
select month,count(amount) from transactions group by month having count(*)<2;

#get total sum of amount generated for each month in bangalore or chicago branches
select month,sum(amount) from transactions where branch = 'bangalore' or branch = 'chicago' group by month;

#get total sum of amount generated for each month in sydney or paris branches having sum of amount <1000
select month,sum(amount) from transactions where branch = 'sydney' or branch = 'paris' group by month having sum(amount)<1000;

#which branch have more than total sum of 4000 in feb 
select branch,sum(amount) from transactions where month='feb' group by branch having sum(amount)>4000;









