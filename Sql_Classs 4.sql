# SQL-CLASS4 -- FUNCTIONS,FUNCTION WITH IF-ELSE-ELSEIF , LOOP

use sales
select * from sales

# FUNCTION..

# Function 1
DELIMITER $$
create function add_to_col(a INT)   # Function input Datatype 
returns INT   #----> FINAL OUTPUT DATATYPE OF A FUNCTION.
DETERMINISTIC
BEGIN 
    DECLARE b int;
    set b = a+10;
    return b;
end $$

select * from sales
select max(sales) from sales # here we are using the INBUILT function..

select add_to_col(15)
select add_to_col(sales) from sales
select add_to_col(quantity),quantity from sales # using the user defined function(udf)...

# Function 2
DELIMITER $$
create function add_col(a int, b int)
returns int
deterministic
begin
      declare c int;
      set c = b+a;
      return c;
end $$

select add_col(quantity,25),quantity from sales

# Function 3
DELIMITER $$
create function final_profit(profit int, discount int)
returns int
deterministic
begin
    declare flag int;
    set flag = profit - discount;
    return flag;
end $$

select profit, discount,final_profit(profit,discount) from sales

# Function 4
DELIMITER $$
create function final_profit_real(profit decimal(20,5), discount decimal(20,5),sales decimal(20,5))
returns int    #----> FINAL OUTPUT DATATYPE OF A FUNCTION.
deterministic
begin
    declare actual_price int;
    set actual_price = profit - sales*discount;
    return actual_price;
end $$
    
select profit, discount,final_profit_real(profit,discount,sales) from sales limit 5

# Function to change datatype of int to str.
DELIMITER $$
create function int_to_str(a int)
returns varchar(10)    #----> FINAL OUTPUT DATATYPE OF A FUNCTION.
deterministic
begin
declare b varchar(10);
set b = a;
return b;
end $$

select int_to_str(10)
select int_to_str(sales) from sales

# if else statement.
select max(sales) , min(sales) from sales

select * from sales

# write function containing if else statement for the following conditions.
1-100 - super affordable
100-300 affordable
300-600 moderate price
600+ expensive

DELIMITER &&
create function mark_sales(sales int)      # input datatype
returns varchar(200)                       # function output datatype.
deterministic
begin
declare flag_sales varchar(200);
if sales < 100 then
	set flag_sales = "super affordable product";
elseif sales >= 100 and sales < 300 then
	set flag_sales = "affordable product";
elseif sales >= 300 and sales <= 600 then
	set flag_sales = "moderate price";
else
	set flag_sales = "expensive";
end if;
return flag_sales;
end &&

select mark_sales(100)
select mark_sales(300)

select sales,mark_sales(sales) from sales

# create new column for the above function
set sql_safe_updates = 0
alter table sales add column price_flag varchar(200)
update sales set price_flag = mark_sales(sales)
select * from sales

# LOOP

# 1.create a loop_table and insert elements using loop.

create table loop_table(val int)     # table to hold loop data

DELIMITER $$
create procedure insert_data()
BEGIN
set @var = 10;   #golobal Variable.- @ is given to declare global variable..
generate_data : loop # genereate_data is random name given to loop
insert into loop_table values(@var);
set @var = @var + 1;
if @var = 100 then
    leave generate_data;
end if;
end loop generate_data;
END $$ 

select * from loop_table
call insert_data()
select * from loop_table

# 2.create a loop_table and insert even elements using loop.

DELIMITER $$
create procedure insert_data1()
BEGIN
set @var = 10;   #golobal Variable.
generate_data : loop
insert into loop_table values(@var);
set @var = @var + 2;
if @var = 100 then
    leave generate_data;
end if;
end loop generate_data;
END $$

call insert_data1() 
select * from loop_table  

# 3.create a loop_table and insert elements divisible by 5.

DELIMITER $$
create procedure insert_data2()
BEGIN
set @var = 10;
generate_data : loop
if @var % 5 = 0 then
	insert into loop_table values(@var);
end if;
set @var = @var+1;
if @var = 100 then
    leave generate_data;
end if;
end loop generate_data;
END $$ 

call insert_data2()
select * from loop_table

select * from loop_table

# TASK
	1 . Create a loop for a table to insert a record into a table for two columns in first column you have to insert a data ranging from 1 to 100 and in second column you have to inset a square of the first column.
	2 . create a user defined function to find out a date differences in number of days .
    3 . create a UDF to find out a log base 10 of any given number .
    4 . create a UDF which will be able to check a total number of records avaible in your table .
    5 . create a procedure to find out  5th highest profit in your sales table you dont have to use rank and windowing function .
    

# Solution 1

Create table table_loop ( val1 int , val2 int)

DELIMITER $$
create procedure insert_record(in a int, in b int)
BEGIN
set @var = a;
set @sqr = 1;
generate_data : loop
set @sqr = @var*@var;
insert into table_loop values (@var,@sqr);
set @var = @var+1;
if @var = (b+1) then
	leave generate_data;
end if;
end loop generate_data;
END $$

select * from table_loop

call insert_record(1,100)
select * from table_loop

# Solution 2
# create a user defined function to find out a date differences in number of days .

DELIMITER $$
create function diff_dates( date1 date, date2 date)
returns int
DETERMINISTIC
BEGIN 
    DECLARE b int;
    set b = (year(date1)-year(date2))*365 + (month(date1)-month(date2))*30 + (day(date1)-day(date2));
    return b;
end $$

select diff_dates("2015-01-28", "2014-06-25") # UDF 
select DATEDIFF("2015-01-28", "2014-06-25");  # inbuilt function..

# Solution 3
# create a UDF to find out a log base 10 of any given number .

DELIMITER $$
create function log_num(val int)
returns decimal(10,5)
DETERMINISTIC
BEGIN 
    DECLARE b decimal(10,5);
    set b = log10(val);
    return b;
end $$

select log_num(2)

# Solution 4
# create a UDF which will be able to check a total number of records avaible in your table .
DELIMITER $$
create function records(table_name varchar(50)
returns int
deterministic
Begin
	declare a int;
    set a = select count(*) from table_name;
    retun a;
END $$

select count(*) from sales

# solution 5
# create a procedure to find out  5th highest profit in your sales table you dont have to use rank and windowing function .

select profit from sales ORDER BY PROFIT desc LIMIT 5

