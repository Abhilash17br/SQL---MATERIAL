# SQL-CLASS 6 -- WINDOWING FUNCTION - RANK, ROW_NUMBER, DENSE RANK
# Windowing Function.. 
# works on subset of the dataset, i,e it creates a group and performs operation on those groups.

# Classified into--
# Aggregated windowing func...
# Analytical windowin func..

create database win_fun
use win_fun

create table ineuron_students (
student_id int,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int,
students_mail_id varchar(50))

insert into ineuron_students values (101,"fsda","saurabh","cs",80,"saurabh@gmail.com")
select * from ineuron_students

insert into ineuron_students values(100 ,'fsda' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com')

select * from ineuron_students

# Aggregated windowing func..

select * from ineuron_students group by student_batch
select student_batch, sum(students_marks) from ineuron_students group by student_batch 
select student_batch, min(students_marks) from ineuron_students group by student_batch 
select student_batch, max(students_marks) from ineuron_students group by student_batch 
select student_batch, avg(students_marks) from ineuron_students group by student_batch 
select student_batch, count(*) , sum(students_marks),avg(students_marks) from ineuron_students group by student_batch 
select student_batch, count(*) as Count , sum(students_marks) as Sum,avg(students_marks) as Average from ineuron_students group by student_batch 
select count(distinct student_batch) from ineuron_students


#Analytical Based Windowing operation 

select * from ineuron_students

# query to get student name , who has recived max marks, from fsda batch..
select student_name ,students_marks , student_batch from ineuron_students where student_batch = 'fsda' order by students_marks desc
select student_name, max(students_marks) from ineuron_students where student_batch = "fsda" # - wrong query.

select student_name, max(students_marks) from ineuron_students where student_batch = "fsda" and students_marks = (select max(students_marks) from ineuron_students where student_batch = "fsda")
select student_name, max(students_marks) from ineuron_students where student_batch = "fsda" and students_marks in (select max(students_marks) from ineuron_students where student_batch = "fsda")

# query to get student name , who has recived 2nd highest marks, from fsda batch..
select student_name ,students_marks , student_batch from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 1,1
# limit 1,5.- This statement returns the rows from table starting from row number 1 and goes ttill next 5 rows.

# SELECT  select_list FROM table_name LIMIT [offset,] row_count;
# The offset specifies the offset of the first row to return. The offset of the first row is 0, not 1.
# The row_count specifies the maximum number of rows to return.
# works like starts from offset value and goes by number of rows.

# to get last row, ( offset - starts from 0)
select student_name ,students_marks , student_batch from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 5,1

# to get 3rd highest result - limit 2,1 (i,e start @ 2, go by 1)
select student_name ,students_marks , student_batch from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 2,1

# to get record of 3rd highest marks from fsda batch, ie even if the multiple students has same marks all of their results must be printed. 

select * from ineuron_students where student_batch  = "fsda" order by students_marks desc limit 2,1 # not accurate.
select students_marks from ineuron_students where student_batch  = "fsda" order by students_marks desc limit 2,1

select * from ineuron_students where student_batch  = "fsda" and students_marks = (select distinct students_marks from ineuron_students where student_batch  = "fsda" order by students_marks desc limit 2,1) # works

# to get 4th highest marks, ie even if the multiple students has same marks all of their results must be printed. 
select * from ineuron_students where student_batch  = "fsda" and students_marks = (select distinct students_marks from ineuron_students where student_batch  = "fsda" order by students_marks desc limit 3,1) # works

# to get 1st highest marks,
select * from ineuron_students where student_batch  = "fsda" and students_marks = (select distinct students_marks from ineuron_students where student_batch  = "fsda" order by students_marks desc limit 0,1) # works

# to get 2st highest marks,
select * from ineuron_students where student_batch  = "fsda" and students_marks = (select distinct students_marks from ineuron_students where student_batch  = "fsda" order by students_marks desc limit 1,1) # works

# row number

select * from ineuron_students 

select student_id, student_batch, student_stream , students_marks,
row_number() over(order by students_marks) as 'row_number' from ineuron_students
# above statement says, list all columns listed and new column called row_number, and arrange whole data in ascending order and give row numbers from lowest to highest.

select student_id, student_batch, student_stream , students_marks,
row_number() over(partition by student_batch order by students_marks) as 'row_number' from ineuron_students

# to get records where row numb = 1 from every batch
select * from (select student_id, student_batch, student_stream , students_marks,
row_number() over(partition by student_batch order by students_marks) as 'row_num' from ineuron_students)
as test where row_num = 1

# to get records of topper from every batch
select * from (
select student_id,student_batch,student_stream,students_marks, row_number() over(partition by student_batch order by students_marks desc) as "row_num" from ineuron_students) as test
where row_num = 1

# to get all details records of topper from every batch from ineuron_students.
select * from ineuron_students where student_id in (
select student_id from (
select student_id,student_batch,student_stream,students_marks, row_number() over(partition by student_batch order by students_marks desc) as "row_num" from ineuron_students) as test where row_num =1)
# with row number if a 2 persons has same marks and are from same number, based on their entry in table, the row numbers are alloted 1, 2.
# if we put where row_num =1 to get toppers from above query, we wont get second person who has recived same marks.
# so rank function is introduced.

# rank
# if two persons recive same marks they are both given same rank if you order by marks.
# from this we can get list of all toppers , even if they are sharing same marks, unlike above.
# but to get details of second person is not possible, as below . follow below.

select student_id, student_batch, student_stream , students_marks,
rank() over(order by students_marks desc) as 'rank' from ineuron_students

select student_id, student_batch, student_stream , students_marks,
rank() over(order by students_marks desc) as 'rank_num', 
row_number() over(order by students_marks desc) as "row_num" from ineuron_students

select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(order by students_marks desc) as "row_num" from ineuron_students

select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch order by students_marks desc) as "row_num" from ineuron_students

select * from(
select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch order by students_marks desc) as "row_num" from ineuron_students) as test where rank_num = 1

#dense_rank.

select student_id, student_batch, student_stream , students_marks,
rank() over(order by students_marks desc) as 'rank_num', 
row_number() over(order by students_marks desc) as "row_num", 
dense_rank() over(order by students_marks desc) as "dense_rank" 
from ineuron_students

# compare from below, to all three functions.

select student_id, student_batch, student_stream , students_marks,
rank() over(order by students_marks desc) as 'rank_num', 
row_number() over(order by students_marks desc) as "row_num", 
dense_rank() over(order by students_marks desc) as "dense_rank" 
from ineuron_students

select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch order by students_marks desc) as "row_num", 
dense_rank() over(partition by student_batch order by students_marks desc) as "dense_rank" 
from ineuron_students

# to get details of 2nd highest marks recived from each batch
select * from(
select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch order by students_marks desc) as "row_num", 
dense_rank() over(partition by student_batch order by students_marks desc) as "dense_ran" 
from ineuron_students) as test where dense_ran =2

# to get details of 3nd highest marks recived from each batch
select * from(
select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch order by students_marks desc) as "row_num", 
dense_rank() over(partition by student_batch order by students_marks desc) as "dense_ran" 
from ineuron_students) as test where dense_ran =3

# to get all details of persons who has recived 3rd highest marks from respective batch.
select * from ineuron_students where student_id in 
(select student_id from(
select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch order by students_marks desc) as "row_num", 
dense_rank() over(partition by student_batch order by students_marks desc) as "dense_rank" 
from ineuron_students) as test where `dense_rank` =3)


select * from(
select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch order by students_marks desc) as "row_num", 
dense_rank() over(partition by student_batch order by students_marks desc) as "dense_ran" 
from ineuron_students) as test where dense_ran in (1,2,3)

# double partition..
select student_id, student_batch, student_stream , students_marks,
rank() over(partition by student_batch ,student_stream order by students_marks desc) as 'rank_num', 
row_number() over(partition by student_batch ,student_stream order by students_marks desc) as "row_num", 
dense_rank() over(partition by student_batch ,student_stream order by students_marks desc) as "dense_ran" 
from ineuron_students
