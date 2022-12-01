# PRIMARY AND FOREIGN KEY

create database key_prim
use key_prim

# Primary key - should not be null and no value to be duplicate.

create table ineuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int,
primary key(course_id));

insert into ineuron values( 01,"FSDA","active",100)
select * from ineuron
insert into ineuron values( 01,"FSDA","not-active",100) # doesnot work , duplicate entry..
insert into ineuron values( 02,"FSDA","not-active",100) # works 

create table students_ineuron(
student_id int,
course_name varchar(60),
steudent_mail varchar(60),
student_status varchar(40),
course_id1 int,
Foreign key(course_id1) references ineuron(course_id) )

insert into students_ineuron values(101,"FSDA", "test@gmail.com" ,"active", 05)
# error @ inserting above line, as tables are related by course_id foreign key looks for any course_id1 value that is inserted
# here with the reference or parent table, if no match found then, it gives error,.
# this is the kind of restriction , the forein key put on while inserting data.

insert into students_ineuron values(101,"FSDA", "test@gmail.com" ,"active", 01)
# works for above table, as 01 value is available in course_id . 

insert into students_ineuron values(101,"FSDA", "test@gmail.com" ,"active", 01)
insert into students_ineuron values(101,"FSDA", "test@gmail.com" ,"active", 01)
insert into students_ineuron values(101,"FSDA", "test@gmail.com" ,"active", 01)
select * from students_ineuron

# the above data insertion is like ( one to many relationship)
# one course  is brought by many students..

create table payment (
course_name varchar(60),
course_id int,
course_live_status varchar(60),
course_launch_date varchar(60),
Foreign key(course_id) references ineuron(course_id))

insert into payment values("FSDA", 01,"not-active", "7th Aug")
insert into payment values("FSDA", 01,"not-active", "7th Aug")
insert into payment values("FSDA", 01,"not-active", "7th Aug")
insert into payment values("FSDA", 01,"not-active", "7th Aug")

# create EER Model - ENHANCED ENTITY MODEL. - MODEL TO know the structure and relations of table in a Database..

create table class ( 
course_id int,
class_name varchar(60),
class_topic varchar(60),
class_duration int,
primary key(course_id),
Foreign key (course_id) references ineuron(course_id))

# int the above column the course_id is behaving as both primary and foreign key, it has properties of both,
# as an foreign key, only values of course_id that exists in ineuron table can be inserted into this table,
# and as an primary key, it cannot be null , and there cannot be duplivcates, therefore only unique values of course_id must exist in class table.
# there-fore this table is in (one to one releationship)with ineuron table.

# multiple primary Key.- not possible.

alter table ineuron add constraint test_prim primary key(course_id, course_name)
alter table ineuron add constraint test_prim primary key(course_status, course_name)
# alteration not possible as multiple primary keys are not possible. as there is a relation already established for primary key of this table.
# multiple columns as an combination of single primary key can exists. will see in next few examples.

alter table ineuron drop primary key
alter table class drop primary key
# cannot drop primary key of the table  as it is  already associated to foreign key of other child tables, thus making this table a parent table.
# to drop a parent table first the associated child tables should be dropped , then the parent table can be dropped.

drop table ineuron
# cannot drop table as it is associated to foreign key of another table, it is as advantage for not deleating parent table.

drop table class
# we can delete child table.
# so to drop parent table , we must first drop all child table then drop a parent table.

create table test(
id int not null,
name varchar(60),
email_id varchar(60),
mobile_no varchar(60),
adress varchar(60))

alter table test add primary key(id)
alter table test drop primary key
alter table test add constraint test_prim primary key(id,email_id) # test_prime is an alias for constraint.
# in the above case we are not creating multiple primary keys , we are creating a combinaton of a single primary key.
# in the ineuron table this was not possible as ,there was already an relatioship existing and hence was not possible.

# Well, a primary key that is made up of 2 or more columns is called a composite primary key. A common real world use case
# for this is, when you have a many-to-many relationship between two tables i.e when multiple rows in one table are associated with multiple rows in another table.

create table parent(
id int not null,
primary key (id))

create table child(
id int,
parent_id int,
foreign key (parent_id) references parent(id))

insert into parent values(1)
select* from parent

insert into child values (1,1)
select * from child

set sql_safe_updates = 0
insert into child values (1,2) # not able to add the entry , some error.
delete from parent where id =1 # not able to delete due to error, if entry here is deleted then relationship would be broken..
delete from child where id =1 # works
select * from child 
delete from parent where id =1 # works

# from above , if u want to delete a record from parent table, first you need to delete the entry from child and then from parent.
# we cannot delete directly from parent.
# inorder to delete directly from parent , so for it to automatically delete from child as well we use cascade.

drop table child

create table child(
id int,
parent_id int,
foreign key (parent_id) references parent(id) on delete cascade)

insert into parent values(1)
insert into parent values(2)
insert into child values (1,1),(1,2),(3,2),(2,2)

select * from parent
select * from child

delete from parent where id = 1 # works as cascade is enabled, now check data in child table..
select * from child # automatically deleated all the values "1" that parent_id holds in child, due to relationship between them.
# child table can only have primary keys that are present in parent key, as value from parent key is deleted , the value gets deleted in child as well.
# it doesnt allow this operation as seeen above, but allows because of cascade option.

update parent set id = 3 where id =2 # doesnot work, so 

drop table child # dropping child table and creating new..

create table child(
id int,
parent_id int,
foreign key (parent_id) references parent(id) on update cascade)

insert into parent values(1)
insert into child values (1,1),(1,2),(3,2),(2,2)

update parent set id = 3 where id =2
select * from child

# in above we have updated values of id from 2 to 3, so value gets updated in child as well, due to "on update cascade" command.


create table child1(
id int,
parent_id int,
foreign key (parent_id) references parent(id) on update cascade on delete cascade)

# can create with both options enabled.




