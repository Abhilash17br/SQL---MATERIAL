# SQL-CLASS1 -- DATABASE, TABLE CREATION & DATA INSERTION, WHERE,GROUPBY,HAVING,OEDER BY, UPDATE, PROCEDURE, VIEW 
show databases
create database if not exists ineuron_fsda
use ineuron_fsda

create table if not exists bank_details(
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30) )

select * from bank_details

insert into bank_details values( 58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no")

describe bank_details

insert into bank_details values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no"),
(57,"technician","divorced","secondary","no",63,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(25,"blue-collar","married","secondary","no",-7,"yes","no","unknown",5,"may",365,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",-3,"no","no","unknown",5,"may",1666,1,-1,0,"unknown","no"),
(36,"admin.","divorced","secondary","no",506,"yes","no","unknown",5,"may",577,1,-1,0,"unknown","no"),
(37,"admin.","single","secondary","no",0,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(44,"services","divorced","secondary","no",2586,"yes","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(50,"management","married","secondary","no",49,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(60,"blue-collar","married","unknown","no",104,"yes","no","unknown",5,"may",22,1,-1,0,"unknown","no"),
(54,"retired","married","secondary","no",529,"yes","no","unknown",5,"may",1492,1,-1,0,"unknown","no"),
(58,"retired","married","unknown","no",96,"yes","no","unknown",5,"may",616,1,-1,0,"unknown","no"),
(36,"admin.","single","primary","no",-171,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(58,"self-employed","married","tertiary","no",-364,"yes","no","unknown",5,"may",355,1,-1,0,"unknown","no"),
(44,"technician","married","secondary","no",0,"yes","no","unknown",5,"may",225,2,-1,0,"unknown","no"),
(55,"technician","divorced","secondary","no",0,"no","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(29,"management","single","tertiary","no",0,"yes","no","unknown",5,"may",363,1,-1,0,"unknown","no"),
(54,"blue-collar","married","secondary","no",1291,"yes","no","unknown",5,"may",266,1,-1,0,"unknown","no"),
(48,"management","divorced","tertiary","no",-244,"yes","no","unknown",5,"may",253,1,-1,0,"unknown","no"),
(32,"management","married","tertiary","no",0,"yes","no","unknown",5,"may",179,1,-1,0,"unknown","no"),
(42,"admin.","single","secondary","no",-76,"yes","no","unknown",5,"may",787,1,-1,0,"unknown","no"),
(24,"technician","single","secondary","no",-103,"yes","yes","unknown",5,"may",145,1,-1,0,"unknown","no"),
(38,"entrepreneur","single","tertiary","no",243,"no","yes","unknown",5,"may",174,1,-1,0,"unknown","no"),
(38,"management","single","tertiary","no",424,"yes","no","unknown",5,"may",104,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",306,"yes","no","unknown",5,"may",13,1,-1,0,"unknown","no"),
(40,"blue-collar","single","unknown","no",24,"yes","no","unknown",5,"may",185,1,-1,0,"unknown","no"),
(46,"services","married","primary","no",179,"yes","no","unknown",5,"may",1778,1,-1,0,"unknown","no"),
(32,"admin.","married","tertiary","no",0,"yes","no","unknown",5,"may",138,1,-1,0,"unknown","no"),
(53,"technician","divorced","secondary","no",989,"yes","no","unknown",5,"may",812,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",249,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",790,"yes","no","unknown",5,"may",391,1,-1,0,"unknown","no"),
(49,"blue-collar","married","unknown","no",154,"yes","no","unknown",5,"may",357,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",6530,"yes","no","unknown",5,"may",91,1,-1,0,"unknown","no"),
(60,"retired","married","tertiary","no",100,"no","no","unknown",5,"may",528,1,-1,0,"unknown","no"),
(59,"management","divorced","tertiary","no",59,"yes","no","unknown",5,"may",273,1,-1,0,"unknown","no"),
(55,"technician","married","secondary","no",1205,"yes","no","unknown",5,"may",158,2,-1,0,"unknown","no"),
(35,"blue-collar","single","secondary","no",12223,"yes","yes","unknown",5,"may",177,1,-1,0,"unknown","no"),
(57,"blue-collar","married","secondary","no",5935,"yes","yes","unknown",5,"may",258,1,-1,0,"unknown","no"),
(31,"services","married","secondary","no",25,"yes","yes","unknown",5,"may",172,1,-1,0,"unknown","no"),
(54,"management","married","secondary","no",282,"yes","yes","unknown",5,"may",154,1,-1,0,"unknown","no"),
(55,"blue-collar","married","primary","no",23,"yes","no","unknown",5,"may",291,1,-1,0,"unknown","no"),
(43,"technician","married","secondary","no",1937,"yes","no","unknown",5,"may",181,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",384,"yes","no","unknown",5,"may",176,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",582,"no","yes","unknown",5,"may",211,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","no",91,"no","no","unknown",5,"may",349,1,-1,0,"unknown","no"),
(49,"services","divorced","secondary","no",0,"yes","yes","unknown",5,"may",272,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","yes",1,"yes","no","unknown",5,"may",208,1,-1,0,"unknown","no"),
(45,"admin.","single","secondary","no",206,"yes","no","unknown",5,"may",193,1,-1,0,"unknown","no"),
(47,"services","divorced","secondary","no",164,"no","no","unknown",5,"may",212,1,-1,0,"unknown","no"),
(42,"technician","single","secondary","no",690,"yes","no","unknown",5,"may",20,1,-1,0,"unknown","no"),
(59,"admin.","married","secondary","no",2343,"yes","no","unknown",5,"may",1042,1,-1,0,"unknown","yes"),
(46,"self-employed","married","tertiary","no",137,"yes","yes","unknown",5,"may",246,1,-1,0,"unknown","no"),
(51,"blue-collar","married","primary","no",173,"yes","no","unknown",5,"may",529,2,-1,0,"unknown","no"),
(56,"admin.","married","secondary","no",45,"no","no","unknown",5,"may",1467,1,-1,0,"unknown","yes"),
(41,"technician","married","secondary","no",1270,"yes","no","unknown",5,"may",1389,1,-1,0,"unknown","yes"),
(46,"management","divorced","secondary","no",16,"yes","yes","unknown",5,"may",188,2,-1,0,"unknown","no"),
(57,"retired","married","secondary","no",486,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(42,"management","single","secondary","no",50,"no","no","unknown",5,"may",48,1,-1,0,"unknown","no"),
(30,"technician","married","secondary","no",152,"yes","yes","unknown",5,"may",213,2,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",290,"yes","no","unknown",5,"may",583,1,-1,0,"unknown","no"),
(60,"blue-collar","married","unknown","no",54,"yes","no","unknown",5,"may",221,1,-1,0,"unknown","no"),
(57,"entrepreneur","divorced","secondary","no",-37,"no","no","unknown",5,"may",173,1,-1,0,"unknown","no"),
(36,"management","married","tertiary","no",101,"yes","yes","unknown",5,"may",426,1,-1,0,"unknown","no"),
(55,"blue-collar","married","secondary","no",383,"no","no","unknown",5,"may",287,1,-1,0,"unknown","no"),
(60,"retired","married","tertiary","no",81,"yes","no","unknown",5,"may",101,1,-1,0,"unknown","no"),
(39,"technician","married","secondary","no",0,"yes","no","unknown",5,"may",203,1,-1,0,"unknown","no"),
(46,"management","married","tertiary","no",229,"yes","no","unknown",5,"may",197,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",-674,"yes","no","unknown",5,"may",257,1,-1,0,"unknown","no"),
(53,"blue-collar","married","primary","no",90,"no","no","unknown",5,"may",124,1,-1,0,"unknown","no"),
(52,"blue-collar","married","primary","no",128,"yes","no","unknown",5,"may",229,1,-1,0,"unknown","no"),
(59,"blue-collar","married","primary","no",179,"yes","no","unknown",5,"may",55,3,-1,0,"unknown","no"),
(27,"technician","single","tertiary","no",0,"yes","no","unknown",5,"may",400,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",54,"yes","no","unknown",5,"may",197,1,-1,0,"unknown","no"),
(47,"technician","married","tertiary","no",151,"yes","no","unknown",5,"may",190,1,-1,0,"unknown","no"),
(34,"admin.","married","secondary","no",61,"no","yes","unknown",5,"may",21,1,-1,0,"unknown","no"),
(59,"retired","single","secondary","no",30,"yes","no","unknown",5,"may",514,1,-1,0,"unknown","no"),
(45,"management","married","tertiary","no",523,"yes","no","unknown",5,"may",849,2,-1,0,"unknown","no"),
(29,"services","divorced","secondary","no",31,"yes","no","unknown",5,"may",194,1,-1,0,"unknown","no"),
(46,"technician","divorced","secondary","no",79,"no","no","unknown",5,"may",144,1,-1,0,"unknown","no"),
(56,"self-employed","married","primary","no",-34,"yes","yes","unknown",5,"may",212,2,-1,0,"unknown","no"),
(36,"blue-collar","married","primary","no",448,"yes","no","unknown",5,"may",286,1,-1,0,"unknown","no"),
(59,"retired","divorced","primary","no",81,"yes","no","unknown",5,"may",107,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",144,"yes","no","unknown",5,"may",247,2,-1,0,"unknown","no"),
(41,"admin.","married","secondary","no",351,"yes","no","unknown",5,"may",518,1,-1,0,"unknown","no"),
(33,"management","single","tertiary","no",-67,"yes","no","unknown",5,"may",364,1,-1,0,"unknown","no"),
(59,"management","divorced","tertiary","no",262,"no","no","unknown",5,"may",178,1,-1,0,"unknown","no"),
(57,"technician","married","primary","no",0,"no","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(56,"technician","divorced","unknown","no",56,"yes","no","unknown",5,"may",439,1,-1,0,"unknown","no"),
(51,"blue-collar","married","secondary","no",26,"yes","no","unknown",5,"may",79,1,-1,0,"unknown","no"),
(34,"admin.","married","unknown","no",3,"yes","no","unknown",5,"may",120,3,-1,0,"unknown","no"),
(43,"services","married","secondary","no",41,"yes","yes","unknown",5,"may",127,2,-1,0,"unknown","no"),
(52,"technician","married","tertiary","no",7,"no","yes","unknown",5,"may",175,1,-1,0,"unknown","no"),
(33,"technician","single","secondary","no",105,"yes","no","unknown",5,"may",262,2,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",818,"yes","yes","unknown",5,"may",61,1,-1,0,"unknown","no"),
(34,"services","married","secondary","no",-16,"yes","yes","unknown",5,"may",78,1,-1,0,"unknown","no"),
(31,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",143,1,-1,0,"unknown","no"),
(55,"services","married","secondary","no",2476,"yes","no","unknown",5,"may",579,1,-1,0,"unknown","yes"),
(55,"management","married","unknown","no",1185,"no","no","unknown",5,"may",677,1,-1,0,"unknown","no"),
(32,"admin.","single","secondary","no",217,"yes","no","unknown",5,"may",345,1,-1,0,"unknown","no"),
(38,"technician","single","secondary","no",1685,"yes","no","unknown",5,"may",185,1,-1,0,"unknown","no"),
(55,"admin.","single","secondary","no",802,"yes","yes","unknown",5,"may",100,2,-1,0,"unknown","no"),
(28,"unemployed","single","tertiary","no",0,"yes","no","unknown",5,"may",125,2,-1,0,"unknown","no"),
(23,"blue-collar","married","secondary","no",94,"yes","no","unknown",5,"may",193,1,-1,0,"unknown","no"),
(32,"technician","single","secondary","no",0,"yes","no","unknown",5,"may",136,1,-1,0,"unknown","no"),
(43,"services","single","unknown","no",0,"no","no","unknown",5,"may",73,1,-1,0,"unknown","no"),
(32,"blue-collar","married","secondary","no",517,"yes","no","unknown",5,"may",528,1,-1,0,"unknown","no"),
(46,"blue-collar","married","secondary","no",265,"yes","no","unknown",5,"may",541,1,-1,0,"unknown","no"),
(53,"housemaid","divorced","primary","no",947,"yes","no","unknown",5,"may",163,1,-1,0,"unknown","no"),
(34,"self-employed","single","secondary","no",3,"yes","no","unknown",5,"may",301,1,-1,0,"unknown","no"),
(57,"unemployed","married","tertiary","no",42,"no","no","unknown",5,"may",46,1,-1,0,"unknown","no"),
(37,"blue-collar","married","secondary","no",37,"yes","no","unknown",5,"may",204,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",57,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",22,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(56,"blue-collar","divorced","primary","no",8,"yes","no","unknown",5,"may",157,2,-1,0,"unknown","no"),
(48,"unemployed","married","secondary","no",293,"yes","no","unknown",5,"may",243,1,-1,0,"unknown","no"),
(43,"services","married","primary","no",3,"yes","no","unknown",5,"may",186,2,-1,0,"unknown","no"),
(54,"blue-collar","married","primary","no",348,"yes","no","unknown",5,"may",579,2,-1,0,"unknown","no"),
(51,"blue-collar","married","unknown","no",-19,"yes","no","unknown",5,"may",163,2,-1,0,"unknown","no"),
(26,"student","single","secondary","no",0,"yes","no","unknown",5,"may",610,2,-1,0,"unknown","no"),
(40,"management","married","tertiary","no",-4,"yes","no","unknown",5,"may",2033,1,-1,0,"unknown","no"),
(39,"management","married","secondary","no",18,"yes","no","unknown",5,"may",85,1,-1,0,"unknown","no"),
(50,"technician","married","primary","no",139,"no","no","unknown",5,"may",114,2,-1,0,"unknown","no"),
(41,"services","married","secondary","no",0,"yes","no","unknown",5,"may",114,2,-1,0,"unknown","no"),
(51,"blue-collar","married","unknown","no",1883,"yes","no","unknown",5,"may",57,1,-1,0,"unknown","no"),
(60,"retired","divorced","secondary","no",216,"yes","no","unknown",5,"may",238,1,-1,0,"unknown","no"),
(52,"blue-collar","married","secondary","no",782,"yes","no","unknown",5,"may",93,3,-1,0,"unknown","no"),
(48,"blue-collar","married","secondary","no",904,"yes","no","unknown",5,"may",128,2,-1,0,"unknown","no"),
(48,"services","married","unknown","no",1705,"yes","no","unknown",5,"may",107,1,-1,0,"unknown","no"),
(39,"technician","single","tertiary","no",47,"yes","no","unknown",5,"may",181,1,-1,0,"unknown","no"),
(47,"services","single","secondary","no",176,"yes","no","unknown",5,"may",303,2,-1,0,"unknown","no" )

select * from bank_details # show all data from table

select count(*) from bank_details # count the number of records

select age,loan,job from bank_details # to filter required records.

select `default` from bank_details

select * from bank_details limit 5 # to show first 5 records

select * from bank_details where age = 33 # filter the columns where age =33

select count(*) from bank_details where age = 33 # to count the records.

select * from bank_details where age > 55

select * from bank_details where age = 60 and job  = "retired"

select * from bank_details where marital = "single" or education = "unknown"
select balance from bank_details where marital = "single" or education = "unknown"

select * from bank_details where (marital = "single" or education = "unknown") and balance < 500

select distinct job from bank_details # to get unique values in job column.
select count(distinct job) from bank_details # to get count of number of unique values in job column.

select * from bank_details order by age # to arrange data in ascending order of age.
select * from bank_details order by age desc # to arrange data in descending order of age.

# Assignment/Task

#with this data try to find out -- ::::

#1. average  of balance 
select balance from bank_details
select sum(balance) from bank_details # sum of balance
select avg(balance) from bank_details # avg of balance

#2a. find the  minimum balance
select min(balance) from bank_details

# 2b.who is having minimum balance
select * from bank_details order by balance limit 1
#or 
select * from bank_details where balance in (select min(balance) from bank_details)
select * from bank_details where balance = (select min(balance) from bank_details)
select * from bank_details where balance = (select min(balance) minbalance from bank_details)

#3a. find the  maximum balance
select max(balance) from bank_details

#3b.who is having maximum balance
select * from bank_details order by balance desc limit 1
#or
select * from bank_details where balance in (select max(balance) from bank_details)
select * from bank_details where balance = (select max(balance) from bank_details)

#4. list of all the person who is having loan
select * from bank_details where loan = "yes"

#5.average balance for all the people whose job role is admin.
select balance from bank_details where job = "admin."
select avg(balance) from bank_details where job = "admin."

#6.person with-out job whose age is below 45.
select * from bank_details where job = "unemployed" and age <45

#7. record where education is pimary and person is jobless
select * from bank_details where job = "unemployed" and education = "primary"

#8.record whose bank account is having a negative balance
select * from bank_details where balance < 0

#9.record who is not having house at all along with there balance.
select * from bank_details where housing = "no"
select balance, housing from bank_details where housing = "no"


# Group by operations.
select * from bank_details

select * from bank_details group by marital
select * from bank_details group by marital order by balance
select * from bank_details group by job order by balance

select marital ,count(*) from bank_details group by marital
select marital, count(*), sum(balance), avg(balance),min(balance), avg(age) from bank_details group by marital
select marital, count(*), sum(balance), avg(balance),min(balance), avg(age),age,balance, loan from bank_details group by marital # DOESNOT PROVIDE ACCURATE LOAN DETAILS.
select marital, count(*), sum(balance), avg(balance),min(balance), avg(age),age,balance, loan from bank_details group by age having balance>1 order by age
select marital, count(*), sum(balance), avg(balance),min(balance), avg(age),age,balance, loan from bank_details group by age having balance>1 order by count(*)

# UPDATE OPTION
set sql_safe_updates=0 
update bank_details set balance=0 where job='unknown'
update bank_details set pdays=0,previous=1,y='y' where loan="no"
select * from bank_details


# DELETE COMMAND
create view tab as select * from bank_details

delete from tab where balance<1

select * from tab
select * from tab order by balance

# procedures..

select * from bank_details

# creating a procedure
DELIMITER &&
create procedure record()
BEGIN
     select * from bank_details;
END &&

# calling a procedure
call record()


DELIMITER &&
create procedure new_proc()
BEGIN
     select * from bank_details where balance in (select max(balance) from bank_details);
END &&

call new_proc()  


DELIMITER &&
create procedure new_func(IN var varchar(30))
BEGIN
     select * from bank_details where job = var;
END &&

call new_func("admin.")
call new_func("unknown")


DELIMITER &&
create procedure new_func1(IN var1 varchar(30), in var2 varchar(30))
BEGIN
     select * from bank_details where job = var1 and education = var2;
END &&

call new_func1("admin.","primary")  
call new_func1("unknown","primary")

# creating views. - creating the subset of the data, to run queries faster.

select * from bank_details

create view bank_view as select age , job , marital, balance, education, loan from bank_details

# we can fire queries for views same as table.
select * from bank_view order by age
select avg(balance) from bank_view where job = "admin."
