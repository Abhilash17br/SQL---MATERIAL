# SQL-CLASS8 -- JOINS-INNER,LEFT,RIGHT,CROSS, INDEX, MULTICOLUMN INDEX,UNIQUE INDEX, UNION, UNION ALL, CTE/WITH CLAUSE.

create database operations
use operations

create table if not exists course (
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50))

create table if not exists student(
student_id int,
student_name varchar(30),
student_mobile int,
student_course_enroll varchar(30),
student_course_id int)

insert into course values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c language'),
(108 , 'c++' , 'C++ language' , 'c++ language')

insert into student values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103)

select * from course
select * from student

# join operation..
# inner join - intersection of the data
select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
inner join student s on c.course_id = s.student_course_id

# left joint all data from left only commomn data from right.
select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
left join student s on c.course_id = s.student_course_id

# to fetch all records not enrolled by students.
select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
left join student s on c.course_id = s.student_course_id where s.student_id is null

# left joint all data from right only commomn data from left.
select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
right join student s on c.course_id = s.student_course_id

# to fetch all records enrolled by students not listed in course.
select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
right join student s on c.course_id = s.student_course_id where c.course_id is null

select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
cross join student s on c.course_id = s.student_course_id
# cross joint works same as inner joint with condition.

select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
cross join student s
# but when condition is removed, it check for every possible combination. complete data mapping.


# indexing..
# reference link - https://dataschool.com/sql-optimization/how-indexing-works/

Types of Indexing
There are two types of databases indexes:

Clustered
Non-clustered

Both clustered and non-clustered indexes are stored and searched as B-trees, a data structure similar to a binary tree. 
A B-tree is a “self-balancing tree data structure that maintains sorted data and allows searches, sequential access, insertions, and deletions in logarithmic time.” 
Basically it creates a tree-like structure that sorts data for quick searching.

Clustered Indexes
Clustered indexes are the unique index per table that uses the primary key to organize the data that is within the table.
The clustered index ensures that the primary key is stored in increasing order, which is also the order the table holds in memory.
Clustered indexes do not have to be explicitly declared.
Created when the table is created.
Use the primary key sorted in ascending order.
Creating Clustered Indexes
The clustered index will be automatically created when the primary key is defined:
CREATE TABLE friends (id INT PRIMARY KEY, name VARCHAR, city VARCHAR);
When searching the table by “id”, the ascending order of the column allows for optimal searches to be performed.
Since the numbers are ordered, the search can navigate the B-tree allowing searches to happen in logarithmic time.
However, in order to search for the “name” or “city” in the table, we would have to look at every entry because these columns do not have an index.
This is where non-clustered indexes become very useful.

Non-Clustered Indexes
Non-clustered indexes are sorted references for a specific field, from the main table, that hold pointers back to the original entries of the table.
They are used to increase the speed of queries on the table by creating columns that are more easily searchable.
Non-clustered indexes can be created by data analysts/ developers after a table has been created and filled.
Note: Non-clustered indexes are not new tables.
Non-clustered indexes hold the field that they are responsible for sorting and a pointer from each of those entries back to the full entry in the table.

You can think of these just like indexes in a book. The index points to the location in the book where you can find the data you are looking for.

To create an index to sort our friends’ names alphabetically:
CREATE INDEX friends_name_asc ON friends(name ASC);

Searching Indexes
After your non-clustered indexes are created you can begin querying with them.
Indexes use an optimal search method known as binary search. Binary searches work by constantly cutting the data in half 
and checking if the entry you are searching for comes before or after the entry in the middle of the current portion of data.
This works well with B-trees because they are designed to start at the middle entry; to search for the entries within the tree 
you know the entries down the left path will be smaller or before the current entry and the entries to the right will be larger or after the current entry.

create table if not exists course1 (
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id))

insert into course1 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c language'),
(108 , 'c++' , 'C++ language' , 'c++ language')

show index from course1

# when you give a index to an column at the time of Table creation, the table will get created in the form of Binary Tree.
# Binary Tree, -- keeps the middle of the record at the top of tree, all values < that will be kept to left and > to right.
# then from all the values on left, similarly it creates a tree, and  in a both right as well.
# when you search for a record , tradinationl way, it has to go through all the records one by one, but
# with indexing, the optimization is established, i,e on searching - it follows the tree, i,e middle value @ first, then if 
# greater than middle val it goes towards right , or else towards left.- this way queries wrt to indexed column can run quick.
# especially searching operations.
# Also, commands like insert , update, delete can be an burden to indexing @ the same time, when an record is updated or deleted or inserted,
# the brinary tree has to updated every time.

explain analyze select * from course1 where course_id = 109;

# or it can be created as follows
create table if not exists course8 (
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50))

create index index_course_id on course8(course_id);
show index from course8
desc course8 ;

#indexing on multiple tables.
create table if not exists course2(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name))

show index from course2
desc course2

insert into course2 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c language'),
(108 , 'c++' , 'C++ language' , 'c++ language')

select * from course2

select * from course2 where course_id = 106
explain analyze select * from course2 where course_id = 106

create table if not exists course3(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_desc))   # creates binary tree on basis of unique data.

show index from course3

SQL Server unique index overview
A unique index ensures the index key columns do not contain any duplicate values.
A unique index may consist of one or many columns. If a unique index has one column, the values in this column will be unique.
In case the unique index has multiple columns, the combination of values in these columns is unique
Any attempt to insert or update data into the unique index key columns that causes the duplicate will result in an error.

A unique index can be clustered or non-clustered.
To create a unique index, you use the CREATE UNIQUE INDEX statement as follows:
CREATE UNIQUE INDEX index_name
ON table_name(column_list);

In this syntax:
First, specify the name of the unique index after the CREATE UNIQUE INDEX keywords.
Second, specify the name of the table to which the index associated and a list of columns that will be included in the index.


# QUERY TO CHECK DUPLICATES IN A COLUMN- METHOD 1
SELECT `COLUMN_NAME`,IF(COUNT(`COLUMN_NAME`)>1,"DUPLI","NODUPLI") AS DUPLI_FLAG FROM SALES GROUP BY `COLUMN_NAME`
SELECT DUPLI_FLAG,COUNT(DUPLI_FLAG) FROM ( SELECT `COLUMN_NAME`,IF(COUNT(`COLUMN_NAME`)>1,"DUPLI","NODUPLI") AS DUPLI_FLAG FROM SALES GROUP BY `COLUMN_NAME`) AS TEST GROUP BY DUPLI_FLAG
# QUERY TO CHECK DUPLICATES IN A COLUMN- METHOD 2
SELECT `COLUMN_NAME`, COUNT(`COLUMN_NAME`) FROM SALES GROUP BY `COLUMN_NAME` HAVING COUNT(`COLUMN_NAME`)>1


# union
++-
# union tries to remove any duplicate entries.
select * from course
select * from student

# 2 seperate queries.
select course_id,course_name from course
select student_id, student_name from student

select course_id,course_name from course
union
select student_id, student_name from student 
# uniomn is an vertical join operation.

select course_id,course_name, course_desc from course
union
select student_id, student_name from student  # doesnot work as number of selected columns from both the queries must be equal.

select course_desc,course_name from course
union
select student_id, student_name from student
# works even if the datatype of columns is diff.

# union all
# it combines every thing ,  duplicates wont be removed here.
# it is similar to union ,except duplicates are not removed..
select course_desc,course_name from course
union all
select student_id, student_name from student

# CTE - COMMON TABLE EXPRESSION.

select * from course where course_id in (101,102,106)

# writing a query on query , i,e creating sub-queries.
select * from (
select * from course where course_id in (101,102,106)) as sample_student where course_tag = 'java'

# same thing using with clause or CTE.
with sample_student as (
select * from course where course_id in (101,102,106))
select * from sample_student where course_tag = 'java'

with outcome_cross as(
select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
cross join student s on c.course_id = s.student_course_id)
select * from outcome_cross where student_id = 301

with cte_test as
(select 1 as col1 , 2 as col2
union all
select 3,4)
select col1, col2 from cte_test

# recursive cte.

with recursive cte(n) as
(select 1 union all select n+1 from cte where n<5)
select * from cte

with recursive cte as
(select 1 as n, 1 as p, -1 as q
union all
select n+1,p+2,q-2 from cte where n<5) # performs operation 4 times , ie < 5.
select * from cte
