# SQL-CLASS3 -- DATEFUNCTIONS,BULK DATA LOADING FOR LARGE FILES,IF CONDITION INTRO.
create database if not exists sales
use sales;

CREATE TABLE sales (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL);
    
select * from sales

set session sql_mode = ''

LOAD DATA INFILE "Z:\sales_data_final.csv" 
into table sales
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 rows

select count(*) from sales 
select * from sales

# CONVERTING STR TO DATE.
# FOR ORDER_DATE COLUMN
# to convert data in str format  to date with datatype datetime.

select str_to_date(order_date,'%m/%d/%Y') from sales # HERE IF THE STRING CONTAINS MONTH, DAY AND THEN HERE AND HENCE '%M/%D/%Y'
# STR_TO_DATE IS AN BULIT IN FUNCTION

# creating a new column for adding data.
alter table sales
add column order_date_new date after order_date # date here is defyning datatype for a feature.

# updating the column with data.
set sql_safe_updates = 0
update sales 
set order_date_new = str_to_date (order_date,'%m/%d/%Y') 
# HERE Y - for year should be caps or else it takes current year.

select * from sales

# FOR SHIP_DATE COLUMN
alter table sales
add column ship_date_new date after ship_date 

update sales
set ship_date_new = str_to_date(ship_date,'%m/%d/%Y') 

select * from sales

# filtering operations

select * from sales where ship_date_new = '2011-01-05'
select * from sales where ship_date_new > '2011-01-05'
select * from sales where ship_date_new < '2011-01-05'
# to pull records between 2 dates.
select * from sales where ship_date_new between '2011-01-05' and '2011-08-30'

# INBUILT FUNCTIONS.

select now() # current timestamp of your system.
select curdate() # gives current date.
select curtime()
select year(now())
select year(curdate())
select year ('2022-10-29 12:20:34')
select year(order_date_new) from sales
select month(order_date_new) from sales
select day(order_date_new) from sales

# to pull out all records until today.
select * from sales where ship_date_new < (select curdate() )

# to pull out all records before a week from today.

# to get the last week date we write
select date_sub(now(), interval 1 week)
select date_sub(curdate(),interval 1 week)

select * from sales where ship_date_new < (date_sub(now(), interval 1 week))

select date_sub(now() , interval 3 day)
select date_sub(now() , interval 3 year)

select year(now())
select year(curdate())
select year ('2022-10-29 12:20:34')
select dayname(now())

SELECT dayname('2022-10-29 12:20:34')
select dayname('2022-10-20 12:20:34')

# INBUILT Function to get the diff of 2 given dates in days.
SELECT DATEDIFF('2014-01-28', '2014-01-27');

# add a flag column with current date.
alter table sales
add column flag date after order_id

update sales
set flag  = now()

# change datatype of year column and add current year.
alter table sales
modify column `year` date;

# to store year  we need to modify the datatype to int.
alter table sales
modify column `year` int;

update sales
set `year` =  year(curdate())

select * from sales

# from order_date_new create 3 new columns for date, month , year
alter table sales add column date_new date after order_id
alter table sales add column month_new date after order_id
alter table sales add column year_new date after order_id

alter table sales modify column date_new int
alter table sales modify column month_new int
alter table sales modify column year_new int

update sales set date_new = day(order_date_new)
update sales set month_new = month(order_date_new)
update sales set year_new = year(order_date_new)

select day(order_date_new) from sales # checking if this works.

select * from sales limit 5

# operations

select avg(sales) from sales where year_new = 2011# to get average sales from year 2011
select avg(sales), year_new from sales group by year_new having year_new = 2011

select avg(sales), year_new from sales group by year_new # to get avg_sales from all years.
select sum(quantity),avg(sales),min(sales), max(sales),sum(sales), year_new from sales group by year_new 

# add a new column as cost to company and group by year.
alter table sales add column cost_to_company decimal(30,10) after profit
update sales set cost_to_company = discount+shipping_cost
select year_new,sum(quantity),sum(sales), avg(profit),sum(cost_to_company) from sales group by year_new

#or
select (discount+shipping_cost) as CTC from sales
select sum(discount+shipping_cost) as CTC from sales group by year_new

select (sales*discount+shipping_cost) as CTC from sales

select * from sales
# if statement in sql..
select order_id,discount, if(discount>0,'yes','no')  as discount_flag from sales

# to find the count of item without discount and with dicsount.
select count(*) ,if(discount>0,'yes','no')  as discount_flag from sales group by discount_flag

# or create a new column and group by that column
alter table sales add column discount_flag varchar(10)
update sales set discount_flag = if(discount>0, 'yes','no')
select discount_flag ,count(*) from sales group by discount_flag

#or
select count(*) from sales where discount > 0
select count(*) from sales where discount = 0

# or
select count(*) from sales group by discount>0

# TASK
# UPLOAD THE GIVEN DATA.- 
# https://docs.google.com/spreadsheets/d/1vcUGPfbH54OglxKYK5ul9VTHWiSKpiI2/edit?usp=sharing&ouid=118282207943964605599&rtpof=true&sd=true

create table online_retail(
InvoiceNo int,
StockCode varchar(30),
`Description` varchar(200),
Quantity int,
InvoiceDate date,
UnitPrice decimal(10,5),
CustomerID int,
Country varchar(50))

select * from online_retail

LOAD DATA INFILE "Z:\Online Retail.csv"
INTO TABLE online_retail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

select * from online_retail
select count(*) from online_retail

# Note : if the file size is more than 1 mb or 1048576 byte , then sql wont allow to upload data, so we have to write a query to resolve this.
set global max_allowed_packet = 209715200
# setting to allow upload of 200 mb. i,e 1048576*200 = 209715200
