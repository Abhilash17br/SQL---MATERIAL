# SQL-CLASS2 -- BULK DATA LOADING, CONSTRAINTS.

# BULK LOADING DATA.
create database if not exists dress_data;
use dress_data;

create table if not exists dress (
`Dress_ID` varchar(30),
`Style` varchar(30),
`Price` varchar(30),
`Rating` varchar(30),
`Size` varchar(30),
`Season` varchar(30),
`NeckLine` varchar(30),
`SleeveLength` varchar(30), 
`waiseline` varchar(30),
`Material` varchar(30),
`FabricType` varchar(30),
`Decoration` varchar(30),
`Pattern Type` varchar(30),
`Recommendation` varchar(30) )

select * from dress

LOAD DATA INFILE "Z:\AttributeDataSet.csv"
into table dress
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

# if "secure-file-priv" error occurs.- then do the  System settings, as follows.
# local C > PROGRAMME DATA >mysql>MySQL Server 8.0>open file "my" in notepad.
# search for "secure-file-priv", and then keep the string initialized to it as blank./
# i,e  secure-file-priv = "" , and save and run., restart system  once.
# while doing the changes , keep mysql workbench server and application closed.


# AUTO INCREMENT CONSTRAINT.

# characteristics of primary key
The PRIMARY KEY constraint uniquely identifies each record in a table. 
Primary keys must contain UNIQUE values, and cannot contain NULL values. 
A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).

create table if not exists test (
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
primary key (test_id) )

insert into test values 
(1, "Abhilash", "abhi@gmail.com", "bangalore"),
(2,"Krish", "krish@gmail.com", "chennai"),
(3,"Hitesh", "hitesh@gmail.com", "noida"),
(4,"subham", "shubam@gmail.com", "jaipur")

select * from test

create table if not exists test1 (
test_id int not null auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
primary key (test_id) )

insert into test1 (test_name,test_mailid,test_adress) values 
( "Abhilash", "abhi@gmail.com", "bangalore"),
("Krish", "krish@gmail.com", "chennai"),
("Hitesh", "hitesh@gmail.com", "noida"),
("subham", "shubam@gmail.com", "jaipur")

select * from test1

# CHECK CONSTRAINT.

create table if not exists test3 (
test_id int ,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
test_salary int check(test_salary > 10000) )

insert into test3 values 
(1, "Abhilash", "abhi@gmail.com", "bangalore",50000),
(2,"Krish", "krish@gmail.com", "chennai",30000),
(3,"Hitesh", "hitesh@gmail.com", "noida",11100),
(4,"subham", "shubam@gmail.com", "jaipur",20000)

select * from test3


#Alter table, adding additional constraint after table creation.
# to add an constraint to existing already created table. we can do.

create table if not exists test4 (
test_id int ,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30) check(test_adress = "bangalore"),
test_salary int check(test_salary > 10000) )

alter table test4 add check (test_id >0)

# doesnot work for this data
insert into test4 values 
(0, "Abhilash", "abhi@gmail.com", "bangalore",50000)

# works for this data
insert into test4 values 
(1, "Abhilash", "abhi@gmail.com", "bangalore",50000)

select * from test4

# NOT NULL
# DEFAULT

create table if not exists test6 (
test_id int NOT NULL default 0 ,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30) check(test_adress = "bangalore"),
test_salary int check(test_salary > 10000) )

insert into test6 (test_name,test_mailid,test_adress,test_salary) values 
("Abhilash", "abhi@gmail.com", "bangalore",50000)

select * from test6

insert into test6 (test_id,test_name,test_mailid,test_adress,test_salary) values 
(101,"Abhilash", "abhi@gmail.com", "bangalore",50000)

select * from test6

# UNIQUE CONSTRAINT. - we cannot enter duplicate values to the column with unique reserved word.
# unique can be added to multiple columns

create table if not exists test8 (
test_id int NOT NULL default 0 ,
test_name varchar(30),
test_mailid varchar(30) unique,
test_adress varchar(30) check(test_adress = "bangalore"),
test_salary int check(test_salary > 10000) )

insert into test8 (test_name,test_mailid,test_adress,test_salary) values 
("Abhilash", "abhi@gmail.com", "bangalore",50000)

# Final Table with all constraints.

create table if not exists test10 (
test_id int NOT NULL auto_increment,
test_name varchar(30) NOT NULL default "unkown",
test_mailid varchar(30) unique NOT NULL,
test_adress varchar(30) check(test_adress = "bangalore") NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id) )

select * from test10
insert into test10 (test_id,test_name,test_mailid,test_adress,test_salary) values 
(100 , "Abhilash", "abhi@gmail.com", "bangalore",50000)

select * from test10 # AUTO INCREMENT WILL TAKE 100 AS INTIAL VALUE AND START WITH INCREMENT FROM HERE.
insert into test10 (test_name,test_mailid,test_adress,test_salary) values 
("Sudhanshu", "sudh@gmail.com", "bangalore",50000)

select * from test10
insert into test10 (test_name,test_mailid,test_adress,test_salary) values 
("Sudhanshu", "sudh1@gmail.com", "bangalore",50000)
insert into test10 (test_id,test_name,test_mailid,test_adress,test_salary) values 
(500 , "Abhilash", "abhi1@gmail.com", "bangalore",50000)
insert into test10 (test_name,test_mailid,test_adress,test_salary) values 
("Abhilash", "abhi2@gmail.com", "bangalore",50000)
insert into test10 (test_name,test_mailid,test_adress,test_salary) values 
("Abhilash", "abhi3@gmail.com", "bangalore",50000)

select * from test10 # observe the pattern of data inserted in test_id.

insert into test10 (test_name,test_mailid,test_adress,test_salary) values 
("Abhilash", "abhi3@gmail.com", "bangalore",50000)
insert into test10 (test_name,test_mailid,test_adress,test_salary) values 
("Abhilash", "abhi4@gmail.com", "bangalore",50000)

select * from test10 

# after trying to execute the above two data insertion, first insertion fails due to unique constraint, as inserted data is not unique.
# in the above case, it will use an increment the value to test-id but as insertion is not sucessful, it will increment again for next,
# data insertion.
# whethere an data insertion is failing or working auto/-increment keeps incrementing.

insert into test10 (test_id,test_name,test_mailid,test_adress,test_salary) values 
(503 , "Abhilash", "abhi5@gmail.com", "bangalore",50000)

select * from test10 

# we can insert a value for missing number in test id.

insert into test10 (test_id,test_name,test_mailid,test_adress,test_salary) values 
(400 , "Abhilash", "abhi6@gmail.com", "bangalore",50000)
insert into test10 (test_name,test_mailid,test_adress,test_salary) values 
("Abhilash", "abhi7@gmail.com", "bangalore",50000)

select * from test10 

# in the above example i have added the test_id to be 400, 
# now again i have inserted record after that, but tes_id for this new inserted record doesnot start at 401,
# instead it next highest number form test_id column.


create table if not exists final(
test_id int not null auto_increment,
test_name varchar(30) unique not null,
test_adress varchar(30) not null default 'unknown',
test_salary int check(test_salary>0),
primary key (test_id))

insert into final (test_name,test_adress,test_salary) values('abhilash','bangalore',10)
insert into final (test_name,test_salary) values('subham',10)
insert into final (test_name,test_adress,test_salary) values('kakashi','mumbai',10)
insert into final (test_id,test_name,test_adress,test_salary) values(5,'kakazu','mumbai',100)
insert into final (test_name,test_salary) values('naruto',10)
select * from final

alter table final add column test_balance int
alter table final add check (test_balance > 0)
alter table final modify column test_balance integer Not null; #doesnot work as table already has few null recorsd for test_balance.

alter table final add column test_check varchar(50)
alter table final modify column test_check varchar(50) not null #doesnot work as table already has few null recorsd for test_check.

# not null constraint can be done on test_salary
alter table final modify column test_salary int not null; 

select * from final

