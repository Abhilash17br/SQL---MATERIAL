# SQL -ANALYTICS WITH ANAND CLASS...

# JOINS --

CREATE DATABASE INEURON_PRACTISE
USE INEURON_PRACTISE

CREATE TABLE DOG_OWNER(
 OwnerID INT NOT NULL PRIMARY KEY,
 `Name` VARCHAR(100),
 Surname VARCHAR(100),
 StreetAddress VARCHAR(100),
 City VARCHAR(100),
 State VARCHAR(100),
 StateFull VARCHAR(100),
 ZipCode VARCHAR(100));

CREATE TABLE PET_DOG
(
 PetID VARCHAR(100) NOT NULL PRIMARY KEY,
 `Name` VARCHAR(100),
 Kind VARCHAR(100),
 Gender VARCHAR(100),
 Age INTEGER,
 OwnerID INTEGER NOT NULL,
 FOREIGN KEY(OwnerID) REFERENCES DOG_OWNER(OwnerID));

LOAD DATA INFILE "Z:\P9-Owners.csv"
into table DOG_OWNER
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "Z:\P9-Pets.csv"
into table PET_DOG
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM DOG_OWNER 
SELECT * FROM PET_DOG

---------------------------------------------------------------------------
CREATE TABLE cows_one (cnumber int, cbreed varchar(20));

INSERT INTO cows_one VALUES (1,'Holstein');
INSERT INTO cows_one VALUES (2,'Guernsey');
INSERT INTO cows_one VALUES (3,'Angus');

CREATE TABLE cows_two (cnumber int, breeds varchar(20));

INSERT INTO cows_two VALUES (2,'Jersey');
INSERT INTO cows_two VALUES (3,'Brown Swiss');
INSERT INTO cows_two VALUES (4,'Ayrshire');

SELECT * FROM COWS_ONE
SELECT * FROM COWS_TWO
---------------------------------------------------------------------------
# TYPES OF JOINS --

1.INNER JOIN
2.LEFT OUTER JOIN
3.RIGHT OUTER JOIN
4.FULL OUTER JOIN
5.LEFT OUTER JOIN EXCLUDING INNER JOIN
6.RIGHT OUTER JOIN EXCLUDING INNER JOIN
7.FULL OUTER JOIN EXCLUDING INNER JOIN
8.CROSS JOIN
9.LEFT ANTI JOIN
10.RIGHT ANTI JOIN

# NOTE IF YOU ARE DOING JOINS ON MULTIPLE TABLES KEEP THE MOST IMPORTANT TABLE, IE THE TABLE WITH MAX AND IMP. DETAILS  AS THE FIRST TABLE.
***********************************************************************************************************************************************************

1.INNER JOIN. - ALL THE COMMON RECORDS BETWEEN THE TABLES WE USE INNER JOIN.
An inner join includes only records in which a value for the key field is common to all input tables. 
That is, unmatched records will not be included in the output dataset.
# EXAMPLE:-
#  SUPPOSE TABLE A IS CUSTOMERS, AND TABLE B IS TRANSACTION, SO THIS JOIN  GIVES THE DETAILS OF ALL CUSTOMERS WHO HAS DONE TRANSACTION.
# I,E IS IT GIVES MATCHING RECORDS FROM BOTH.

# FOR ALL TABLES FROM BOTH.. - CAN BR DONE USING ALIAS
SELECT X.* , Y.* FROM DOG_OWNER X INNER JOIN PET_DOG Y ON X.OWNERID = Y.OWNERID 
# CAN BE DONE THIS WAY TOO - SELECT * MEANS IT SELECTS ALL FROM BOTH TABLES.
SELECT * FROM DOG_OWNER INNER JOIN PET_DOG  ON DOG_OWNER.OWNERID = PET_DOG.OWNERID 

# SIMILAR STATEMEMT WHICH GIVES THE RESULTS OF INNER JOINS.-
# 1.CAN BE DONE USING WHERE CLAUSE..
SELECT *  FROM DOG_OWNER,PET_DOG WHERE DOG_OWNER.OWNERID = PET_DOG.OWNERID 

# 2.CAN BE DONE USING USING CLAUSE..
SELECT *  FROM DOG_OWNER INNER JOIN PET_DOG USING(OWNERID)   # - NOTE HERE COMMON KEY MUST BE HAVING SAME NAME IN BOTH TABLES.
SELECT *  FROM DOG_OWNER INNER JOIN PET_DOG USING(NAME,OWNERID) #- USING TWO COLUMNS - THIS IS LIKE AN NATURAL JOIN.., MATCHING ON TWO COLUMNS

# 3.CAN BE DONE USING - NATURAL JOINT.. - IT DOES INNER JOIN ON ALL THE MATCHING COLUMNS.
  # - IF THERE IS ONE MATCHING COLUMN, IT MATCHES ON ONE COLUMN AND , IF THERE ARE TWO COLUMNS IT MATCHES ON ONE AND TWO AND GIVES A INNER JOINT,
  #  - AND ALSO UPON DOING INNER JOINT - IT DOESNOT REPEAT THE COLUMN NAMES UNLIKE INNER JOIN.

SELECT * FROM DOG_OWNER NATURAL JOIN PET_DOG ; # NOTE IF NO COLUMNS NAMES ARE SIMILAR FROM TABLES IT DOES IS CARTISIAN PRODUCT.
SELECT * FROM DOG_OWNER NATURAL INNER JOIN PET_DOG ;  # SAME AS ABOVE...
SELECT * FROM DOG_OWNER NATURAL LEFT JOIN PET_DOG ;  # IT FOLLWS LEFT JOIN ON MATCHING JOIN, AND GIVES ONLY ONE MATCHING COLUMN.
													 # IF NO COLUMNS MATCH IT DOES IS CARTISION PRODUCT.
                                                     
# FOLLOW BELOW - NATURAL JOIN ON NO MATCHING COLUMNS.
	
CREATE TABLE cow1 (cnumber1 int, cbreed varchar(20));
INSERT INTO cow1 VALUES (1,'Holstein');
INSERT INTO cow1 VALUES (2,'Guernsey');
INSERT INTO cow1 VALUES (3,'Angus');
SELECT * FROM COW1

CREATE TABLE cows2 (cnumber2 int, breeds varchar(20));
INSERT INTO cows2 VALUES (2,'Jersey');
INSERT INTO cows2 VALUES (3,'Brown Swiss');
INSERT INTO cows2 VALUES (4,'Ayrshire');
SELECT * FROM COWS2

SELECT * FROM COW1 NATURAL JOIN COWS2 ;
# THIS IS AN CARTISIAN PRODUCT AS - NONE OF THE COLUMNS MATCH, AND HENCE, EVERY COLUMN FROM TABLE A IS MATCHED TO ALL COLUMN SFROM TYABLE B.
----------------------------------------------------------------------
SELECT * FROM COWS_ONE
SELECT * FROM COWS_TWO

# DIFF BETWEEN INNER AND NATURAL JOINT IS THAT, IT DOESNOT ALLOW REPETATION OF COLUMN, CHECK BELOW.
SELECT * FROM COWS_ONE INNER JOIN COWS_TWO ON COWS_ONE.CNUMBER = COWS_TWO.CNUMBER
SELECT * FROM COWS_ONE NATURAL JOIN COWS_TWO        # -- A TYPICAL; INNER JOINT WITH NO REPETATION OF COLUMN CNUMBER AGAIN..   
SELECT * FROM COWS_ONE NATURAL INNER JOIN COWS_TWO  # -- A TYPICAL; INNER JOINT WITH NO REPETATION OF COLUMN CNUMBER AGAIN..
SELECT * FROM COWS_ONE NATURAL LEFT JOIN COWS_TWO   # -- A TYPICAL; LEFT JOINT WITH NO REPETATION OF COLUMN CNUMBER AGAIN..
-----------------------------------------------------------------------

#- Conditions ON, USING, and NATURAL
You can use the join conditions ON, USING, and NATURAL to specify join criteria.
The ON clause is the most flexible. 
It can handle all join criteria, and, in certain cases, non-join criteria.
The USING and NATURAL clauses provide convenient ways to specify joins when the join columns have the same name..
---

# FOR SELECTED TABLES FROM BOTH..
SELECT X.OWNERID,X.NAME,Y.PETID,Y.NAME FROM DOG_OWNER X INNER JOIN PET_DOG Y ON X.OWNERID = Y.OWNERID LIMIT 5

# FOR SELECTED TABLES FROM ONLY TABLE A. , FOR TABLE B USE Y.* INSTED OF X.*...
SELECT X.* FROM DOG_OWNER X INNER JOIN PET_DOG Y ON X.OWNERID = Y.OWNERID LIMIT 5
***********************************************************************************************************************************************************

2. LEFT OUTER JOIN..

Left outer join  produces a complete  set of records from  Table A, with the  matching records  (where available) in  Table B. 
If there is no  match, the right side  will contain null.

# EXAMPLE:-1
#  SUPPOSE TABLE A IS CUSTOMERS, AND TABLE B IS TRANSACTION, SO THIS JOIN  GIVES ALL THE RECORDS OF ALL THE CUSTOMERS FROM CUSTOMER TABLE AND ONLY THOSE WHO HAS DONE TRANSACTION DONE BY CUSTOMERS FROM TRANSATION TABLE.
# THE CUSTOMERS WHO HAS NOT DONE TRANCACTION WILL BE GIVEN AS NULL.

# EXAMPLE:-2
#  SUPPOSE TABLE A IS TRANSATION , AND TABLE B IS CUSTOMERS, SO THIS JOIN  GIVES ALL THE RECORDS OF ALL THE TRANSATION FROM TRANSACTION TABLE AND ONLY THOSE DETAILS OF THOSE CUSTOMERS WHO HAS DONE TRANSACTION FROM CUSTOMER TABLE.
# THE TRANSACTION WHICH DOESNOT HAVE CUSTOMERS WILL BE GIVEN AS NULL.

# FOR ALL TABLES FROM BOTH.. - CAN BR DONE USING ALIAS
SELECT X.* , Y.* FROM DOG_OWNER X LEFT OUTER JOIN PET_DOG Y ON X.OWNERID = Y.OWNERID

# CAN BE DONE THIS WAY TOO - SELECT * MEANS IT SELECTS ALL FROM BOTH TABLES.
SELECT * FROM DOG_OWNER LEFT OUTER JOIN PET_DOG  ON DOG_OWNER.OWNERID = PET_DOG.OWNERID
# THIS MEANS THAT, WE GET ALL THE RECORDS FROM DOG_OWNER AND ONLY THOSE RECORDS THAT ARE MATCHING FROM PET_DOG TABLE.,
# --- THE RECORDS THAT ARE IN DOG_OWNER AND DOESNOT HAVE MATCHING OWNERID FROM PET COLUMN WILL BE SHOWN NULL.
# RESULTING NUMBER OF RECORDS WE GET WILL BE EQUAL TO NUMBER OF RECORDS FROM FIRST TABLE...OBSERVE BELOW..

# ALTERING COLUMNS NAME ------
ALTER TABLE DOG_OWNER 
RENAME COLUMN  `Name`TO OWNER_Name 
ALTER TABLE PET_DOG 
RENAME COLUMN  `Name`TO DOG_Name 

SELECT * FROM PET_DOG LEFT OUTER JOIN DOG_OWNER  ON PET_DOG.OWNERID = DOG_OWNER.OWNERID
SELECT COUNT(*) FROM PET_DOG LEFT OUTER JOIN DOG_OWNER  ON PET_DOG.OWNERID = DOG_OWNER.OWNERID
SELECT COUNT(*) FROM PET_DOG 

# HERE THE CASE IS EXCEPTIONAL AS ONE OWNER ID IS RELATED TO 1 OR MORE PETS SO THERE ARE 100 COLUMNS.
# WHEN THE CASE IS SUCH THAT , THE FIRST COLUMN SELECTED HAS THE MAXIMUM COLUMNS THEN THE OTHER COMMING COLUMNS THEN , NUMBER OF 
# -- COLUMNS FROM THE  FIRST TABLE WILL BE THE NUMBER OF COLUMN SFROM RESULTING TABLE...
# OBSERVE THE BELOW EXAMPLE...

SELECT * FROM COWS_ONE LEFT OUTER JOIN COWS_TWO ON COWS_ONE.CNUMBER = COWS_TWO.CNUMBER 
SELECT * FROM COWS_ONE

SELECT * FROM COWS_TWO LEFT OUTER JOIN COWS_ONE ON COWS_TWO.CNUMBER = COWS_ONE.CNUMBER 
SELECT * FROM COWS_TWO

# SEE NUMBER OF COLUMNS THAT ARE IN THE FIRST COLUMN SWILL BE THE MAX NUMBER OF COLUMMNS..

# IMPORTANT NOTE --  
1.LEFT JOIN AND LEFT OUTER JOIN BOTH ARE SAME, BUT DIFFERENCE IS THAT EXECUTION TIME FOR LEFT OUTER JOIN IS MUCH FASTER WHEN
----COMPARED TO LEFT JOIN...
2.LEFT OUTER JOIN IS USED TO CREATE MASTER TABLE,THAT HAS ALL THE DATA TO DO FURTHER ANALYSIS BASED ON CLIENT REQUIREMENTS..
  -#THIS IS A TABLE TT CONTAINS ALL THE INFORMATION AS PER CLIENTS REQUIREMENT, WE CREATE MASTER TABLE AND THEN WE QUERY THE CLIENTS REQUIREMENTS BASED ON THAT...
   
# MASTER TABLE - USING LEFT OUTER JOIN ----*-----*----*-----*----*-----*----*-----*----*-----*----*-----*----*-----*----*-----*----*-----*----*-----*----*

------------------------------------------------------------------------------------------------------------------------------------
# TABLE CREATION 
-------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_COMPLAIN (
ID INT,
ComplainDate VARCHAR(10),
CompletionDate VARCHAR(10),
CustomerID INT,
BrokerID INT, 
ProductID INT,
ComplainPriorityID INT,
ComplainTypeID INT,
ComplainSourceID INT,
ComplainCategoryID INT,
ComplainStatusID INT,
AdministratorID INT,
ClientSatisfaction VARCHAR(20),
ExpectedReimbursement INT);
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_CUSTOMER
(
CustomerID	INT,
LastName VARCHAR(60),
FirstName VARCHAR(60),
BirthDate VARCHAR(20) ,
Gender VARCHAR(20),
ParticipantType	VARCHAR(20),
RegionID	INT,
MaritalStatus VARCHAR(15));
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_BROKER
(
  BrokerID	INT,
  BrokerCode VARCHAR(70),
  BrokerFullName	VARCHAR(60),
  DistributionNetwork	VARCHAR(60),
  DistributionChannel	VARCHAR(60),
  CommissionScheme VARCHAR(50));
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_CATAGORIES (
ID	INT,
Description_Categories VARCHAR(200),
Active INT);
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_PRIORITIES (
ID	INT,
Description_Priorities VARCHAR(10));
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_PRODUCT (
ProductID	INT,
ProductCategory	VARCHAR(60),
ProductSubCategory	VARCHAR(60),
Product VARCHAR(30));
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_REGION (
  id INT,
  `Name`	VARCHAR(50) ,
  county	VARCHAR(100),
  state_code	CHAR(5),
  state	VARCHAR (60),
  `Type`	VARCHAR(50),
  latitude	DECIMAL(11,4),
  longitude	DECIMAL(11,4),
  area_code	INT,
  population	INT,
  Households	INT,
  median_income	INT,
  land_area	INT,
  water_area	INT,
  time_zone VARCHAR(70));
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_SOURCES (
ID	INT,
Description_Source VARCHAR(20)
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_STATE_REGION (
  State_Code VARCHAR(20),	
  State	 VARCHAR(20),
  Region VARCHAR(20)
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_STATUSES
(
  ID	INT,
  Description_Status VARCHAR(40));
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_TYPE (
  ID INT	,
  Description_Type VARCHAR(20)
);
---------------------------------------------------------------------------------------------------------
CREATE TABLE AJ_STSTUS_HISTORY (
ID INT,
ComplaintID VARCHAR(20),
ComplaintStatusID INT,
StatusDate VARCHAR(20));
-----------------------------------------------------------------------------------------------------------------------------------
# LOADING DATA
------------------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Complains_Data.csv"
into table AJ_COMPLAIN
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Customers.csv"
into table AJ_CUSTOMER
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Brokers.csv"
into table AJ_BROKER
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Categories.csv"
into table AJ_CATAGORIES
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Priorities.csv"
into table AJ_PRIORITIES
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Products.csv"
into table AJ_PRODUCT
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Sources.csv"
into table AJ_SOURCES
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Regions.csv"
into table AJ_REGION
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\State_Regions.csv"
into table AJ_STATE_REGION
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Statuses.csv"
into table AJ_STATUSES
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Types.csv"
into table AJ_TYPE
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Types.csv"
into table AJ_TYPE
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;
-------------------------------------------------------------------------------------------------------------------------
LOAD DATA INFILE "Z:\Status_History_Data.csv"
into table AJ_STSTUS_HISTORY
FIELDS TERMINATED by  ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM AJ_COMPLAIN;       # PK - ID - MAIN TABLE , FIRST TABLE.
SELECT * FROM AJ_CUSTOMER;       # PK  - CustomerID COMMON WITH  - CustomerID FROM AJ_COMPLAIN
SELECT * FROM AJ_BROKER;         # PK  - BrokerID COMMON WITH  - BrokerID FROM AJ_COMPLAIN
SELECT * FROM AJ_CATAGORIES;     # PK  - ON ID COMMON WITH ComplainCategoryID FROM AJ_CUSTOMER
SELECT * FROM AJ_PRIORITIES;     # PK  - ON ID COMMON WITH ComplainPriorityIDD FROM AJ_COMPLAIN
SELECT * FROM AJ_PRODUCT;        # PK  - ON ProductID COMMON WITH - ProductID FROM AJ_COMPLAIN
SELECT * FROM AJ_REGION;         # PK  - ON RegionID COMMON WITH  - RegionID FROM AJ_COMPLAIN
SELECT * FROM AJ_SOURCES;        # PK  - ON ID COMMON WITH  - ComplainSourceID FROM AJ_COMPLAIN
SELECT * FROM AJ_STATE_REGION;   # PK  - ON State_Code COMMON WITH  -state_code FROM AJ_REGION
SELECT * FROM AJ_STATUSES;       # PK  - ON ID COMMON WITH  - ComplainStatusID FROM AJ_COMPLAIN
SELECT * FROM AJ_TYPE;           # PK  - ON ID COMMON WITH  - ComplainTypeID FROM AJ_COMPLAIN
SELECT * FROM AJ_STSTUS_HISTORY; # PK  - COULD NOT USE AS THERE IS NO COMMON DATA BETWEEN ANY TABLES AND THIS.


CREATE TABLE AJ_CUST_MASTER AS 
SELECT COM.ID,COM.ComplainDate,COM.CompletionDate,COM.AdministratorID,COM.ClientSatisfaction,
CUS.CustomerID,CUS.FirstName,CUS.LastName,CUS.BirthDate,CUS.Gender,CUS.MaritalStatus,
BR.BrokerID,BR.BrokerCode,BR.BrokerFullName,BR.CommissionScheme,
CAT.Description_Categories,
PR.Description_Priorities,
PD.ProductCategory,PD.ProductSubCategory,PD.Product,
REG.`Name`,REG.county,REG.state,REG.area_code,REG.latitude,REG.longitude,REG.population,REG.Households,REG.median_income,
SO.Description_Source,
SR.Region,
ST.Description_Status,
TY.Description_Type
FROM AJ_COMPLAIN COM
LEFT OUTER JOIN AJ_CUSTOMER CUS ON COM.CustomerID = CUS.CustomerID
LEFT OUTER JOIN AJ_BROKER BR ON COM.BrokerID = BR.BrokerID
LEFT OUTER JOIN AJ_CATAGORIES CAT ON COM.ComplainCategoryID = CAT.ID
LEFT OUTER JOIN AJ_PRIORITIES PR ON COM.ComplainPriorityID = PR.ID
LEFT OUTER JOIN AJ_PRODUCT PD ON COM.ProductID = PD.ProductID
LEFT OUTER JOIN AJ_REGION REG ON CUS.RegionID = REG.ID
LEFT OUTER JOIN AJ_SOURCES SO ON COM.ComplainSourceID = SO.ID
LEFT OUTER JOIN AJ_STATE_REGION SR ON REG.state_code = SR.State_Code
LEFT OUTER JOIN AJ_STATUSES ST ON COM.ComplainStatusID = ST.ID
LEFT OUTER JOIN AJ_TYPE TY ON COM.ComplainTypeID = TY.ID ; 

set global max_allowed_packet = 1048576000

# DIDN'T WORK AS , TOO BIG FILE... CAN REFER FOR SAME FROM SNOWFLAKE - SQL_JOINTS DATABASE..

# CRTEATING MASTER TABLE TO WORK ON AL THE CUSTOMER REQUIREMENTS.LEFT JOINT IS MAINLY USED FOR THIS PURPOSE.
# ---INTERVIEW Q . FROM TABLE A LEFT JOINT TABLE B , WHIVH TABLE WILL HAVE NULL ELEMENTS.. - ANS.. TABLE B.-- RECALL BY DEFINATION.
***********************************************************************************************************************************************************

3. RIGHT OUTER JOIN..

Right outer join  produces a complete  set of records from  Table B, with the  matching records  (where available) in  Table A.
If there is no  match, the left side  will contain null.

--A right join selects all the rows from the table on the right  and displays the matching rows from the table on the left (cows_one). 
-- It displays an empty row for the table on the left if the table has no matching value for the table on the right.
SELECT * FROM COWS_ONE
SELECT * FROM COWS_TWO

SELECT * FROM cows_one 
RIGHT OUTER JOIN cows_two ON cows_one.cnumber = cows_two.cnumber;

# NOTE: INREALITY WE DONT USE RIGHT OUTER JOIN,- WE COULD ALWAYS USE LEFT OUTER JOIN BY FLIPPING TABLES.
***********************************************************************************************************************************************************

4. FULL OUTER JOIN.
 
 Full outer join  produces the set of  all records in Table A  and Table B, with  matching records  from both sides  where available.
 If  there is no match,  the missing side will  contain null.
 
 SYNTAX -- 
 SELECT * FROM TableA FULL OUTER JOIN TableB ON TableA.PK= TableB.PK


 # FULL OUTER JOIN CAN ALSO BE USED TO CREATE MASTER TABLE..
 # MY SQL DOESNOT HAVE FULL OUTER JOIN -CAN BE Simulate using UNION, LEFT and RIGHT JOINs.
 SYNTAX...
 SELECT * FROM TableA LEFT JOIN TableB  ON TableA.PK = TableB.PK
 UNION
 SELECT * FROM TableA RIGHT JOIN TableB ON TableA.PK = TableB.PK
 
# UNION - ONLY CONSIDER DISTINCT RECORDS, UNIONALL - CONSIDERS DUPLICATES ALSO..

SELECT * FROM cows_one LEFT OUTER JOIN cows_two ON cows_one.cnumber = cows_two.cnumber
UNION
SELECT * FROM cows_one RIGHT OUTER JOIN cows_two ON cows_one.cnumber = cows_two.cnumber ;
***********************************************************************************************************************************************************

5.LEFT JOIN EXCLUDING INNER JOIN.
#- This query will return  all of the records in  the left table (table  A) that do not match  any records in the  right table (table B).

# EXAMPLE:-
#  SUPPOSE TABLE A IS CUSTOMERS, AND TABLE B IS TRANSACTION, SO THIS JOIN  GIVES THE DETAILS OF ALL CUSTOMERS WHO HAS NOT DONE TRANSACTION.
SYNTAX - 
SELECT * FROM TableA LEFT JOIN TableB  ON TableA.PK = TableB.PK
WHERE TableB.PK IS NULL
# IT MEANS THAT LEFT JOIN CONTAINS ALL RECORDS OF TABLE A , AND THOSE MATCHING FROM TABLE B, 
# -AND NULL VALUES WILL BE PRESENT @ THOSE PLACES WHERE THERE IS NO MATCH TO TABLE A FROM TABLE B.
# - THESE NULL VALUES ARE THE RECORDS OF THE CUST5OMER WHO HAS NOT DONE TRANSACTION...

5.RIGHT JOIN EXCLUDING INNER JOIN. - SIMILAR - FLIP TABLE FOR LEFT JOIN.

- WHY RIGHT JOIN IS NEEDED ?
-- SUPPOSE AN TABLE EXISTS ALREADY, YOU WANT TO JOIN AN TABLE AND YOU WANT THE NEW COLUMNS @ THE BEGINNING THEN USE RIGHT JOIN. I, TABLE B RJ TABLE A.
-- SUPPOSE YOU WANT THE NEW COLUMNS @ THE END THEN USE LEFT JOIN. TABLE A RJ TABLE B.
--- THIS IS BASICALLY TO DEFINE THE TABLE STRUCTURE...
***********************************************************************************************************************************************************

6.FULL OUTER EXCLUDING INNER JOIN. - SIMILAR - FLIP TABLE FOR LEFT JOIN.

# EXAMPLE:-
#  SUPPOSE TABLE A IS CUSTOMERS, AND TABLE B HAS TRANSACTION AGENT INFO, SO THIS JOIN  GIVES THE DETAILS OF ALL CUSTOMERS WHO IS NOT ASSOCIATED WITH AGENT,
   -# -ALONG WITH THEIR CUSTOMER INFO AND AGENT INFO..
FULL OUTER JOIN - INNER JOIN.

SYNTAX -- 
SELECT * FROM TableA FULL OUTER JOIN TableB  ON TableA.PK = TableB.PK
WHERE TableA.PK IS NULL OR  TableB.PK IS NULL

# USING MYSQL...
SELECT * FROM TableA LEFT JOIN TableB  ON TableA.PK = TableB.PK
WHERE TableB.PK IS NULL  UNION
SELECT * FROM TableA RIGHT JOIN TableB
ON TableA.PK = TableB.PK  WHERE TABLEA.PK IS NULL
***********************************************************************************************************************************************************


