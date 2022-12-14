# SQL-CLASS9 -- TRIGGERS, CASE

# Triggers
A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.
DML triggers run when a user tries to modify data through a data manipulation language (DML) event.
DML events are INSERT, UPDATE, or DELETE statements on a table or view.

# TRIGGERS ARE USEED TO TRIGGER SOME ACTION BEFORE OR AFTER FEW OPERATIONS LIKE INSERT, UPDATE, DELETE.
# THERE ARE 6 TYPES OF TRIGGERS, - BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, BEFORE DELETE, AFTER DELETE.
# WHEN EVER AN TRIGGER IS CREATED , BASED ON THE TYPE IT PERFORMS SOME OPERATION.
# WHEN AN BEFORE INSERT TRIGGER IS CREATED, WHEN EVER A DATA IS INSERTED TO AN TABLE, THE TRIGGER WILL BE ACTIVATED, BEFORE DATA INSERTION.

# SYNTAX
create trigger [trigger_name] 
[before | after]  
{insert | update | delete}  
on [table_name]  
[for each row]  
[trigger_body] 

Explanation of syntax:

create trigger [trigger_name]: Creates or replaces an existing trigger with the trigger_name.
[before | after]: This specifies when the trigger will be executed.
{insert | update | delete}: This specifies the DML operation.
on [table_name]: This specifies the name of the table associated with the trigger.
[for each row]: This specifies a row-level trigger, i.e., the trigger will be executed for each row being affected.
[trigger_body]: This provides the operation to be performed as trigger is fired.

#######

CREATE DATABASE INEURON5
USE INEURON5

CREATE TABLE COURSE(
COURSE_ID INT,
COURSE_DESC VARCHAR(50),
COURSE_MENTOR VARCHAR(60),
COURSE_PRICE INT,
COURSE_DISCOUNT INT,
CREATE_DATE DATE) ; # VARIABLE TO BE UPDATED ON TRIGGER.

CREATE TABLE COURSE_UPDATE(
COURSE_MENTOR_UPDATE VARCHAR(50),
COURSE_PRICE_UPDATE INT,
COURSE_DISCOUNT_UPDATE INT)

# BEFORE INSERT.- EXAMPLE 1
DELIMITER //
CREATE TRIGGER COURSE_BEFORE_INSERT
BEFORE INSERT
ON COURSE FOR EACH ROW
BEGIN
	SET NEW.CREATE_DATE = SYSDATE();
END; //

SELECT SYSDATE() # GIVES SYSTEM DATE.

SELECT * FROM COURSE
INSERT INTO COURSE (COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DISCOUNT) VALUES(101,"FSDA","SUDHANSHU",4000,10)
# MAPPING OF VARIBLES TO VALUES MUST BE DONE AS ABOVE, TO AVOID ERROR, CREATE_DATE WILL BE UPDATED BY TRIGGER.
SELECT * FROM COURSE
# ON INSERT OPERATION EVERY TIME THE SYSTEM DATE WILL BE UPDATED TO TABLE , BECAUSE OF TRIGGER.

# BEFORE INSERT.- EXAMPLE 2
CREATE TABLE COURSE1(
COURSE_ID INT,
COURSE_DESC VARCHAR(50),
COURSE_MENTOR VARCHAR(60),
COURSE_PRICE INT,
COURSE_DISCOUNT INT,
CREATE_DATE DATE,            # VARIABLE TO BE UPDATED ON TRIGGER.
USER_INFO VARCHAR(50)) ;     # VARIABLE TO BE UPDATED ON TRIGGER.

DELIMITER //
CREATE TRIGGER COURSE_BEFORE_INSERT1
BEFORE INSERT
ON COURSE1 FOR EACH ROW
BEGIN
	DECLARE USER_VAL VARCHAR(50);
	SET NEW.CREATE_DATE = SYSDATE();
    SELECT USER() INTO USER_VAL;
    SET NEW.USER_INFO = USER_VAL;
END; //

SELECT USER() # GIVES USER INFO..

INSERT INTO COURSE1 (COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DISCOUNT) VALUES(101,"FSDA","SUDHANSHU",4000,10)
SELECT * FROM COURSE1
# ON INSERT OPERATION EVERY TIME THE SYSTEM DATE, USER INFO WILL BE UPDATED TO TABLE , BECAUSE OF TRIGGER.

INSERT INTO COURSE1 (COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DISCOUNT) VALUES
(102,"POWER BI","ANAND JHA",4000,30),
(103,"FSDS","SUDHANSHU",4000,15)

SELECT * FROM COURSE1 # FROM TRIGGER, SEE LINE  ---> ON COURSE FOR EACH ROW LINE -->, TRIGGER TO GET EXECUTED ON EACH ROW .

# BEFORE INSERT.- EXAMPLE 3
CREATE TABLE REF_COURSE(
RECORD_INSERT_DATE DATE,
RECORD_INSERT_USER VARCHAR(50));

SELECT * FROM REF_COURSE

DELIMITER //
CREATE TRIGGER COURSE_BEFORE_INSERT2
BEFORE INSERT
ON COURSE1 FOR EACH ROW
BEGIN
	DECLARE USER_VAL VARCHAR(50);
	SET NEW.CREATE_DATE = SYSDATE();
    SELECT USER() INTO USER_VAL;
    SET NEW.USER_INFO = USER_VAL;
    INSERT INTO REF_COURSE VALUES( SYSDATE(),USER_VAL);
END; //

SELECT * FROM REF_COURSE

INSERT INTO COURSE1 (COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DISCOUNT) VALUES
(102,"POWER BI","ANAND JHA",4000,30),
(103,"FSDS","SUDHANSHU",4000,15)

SELECT * FROM COURSE1
SELECT * FROM REF_COURSE

# NOTE: INSIDE TRIGGERS WE CAN WRITE ANY SQL STATEMENT.

# BEFORE INSERT.- EXAMPLE 4
CREATE TABLE TEST1(
C1 VARCHAR(50),
C2 DATE,
C3 INT)

CREATE TABLE TEST2(
C1 VARCHAR(50),
C2 DATE,
C3 INT)

CREATE TABLE TEST3(
C1 VARCHAR(50),
C2 DATE,
C3 INT)

DELIMITER //
CREATE TRIGGER TO_UPDATE_OTHERS
BEFORE INSERT ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST2 VALUES("XYZ",SYSDATE(),2525);
    INSERT INTO TEST3 VALUES("ABC",SYSDATE(),5252);
END;//

INSERT INTO TEST1 VALUES("ABHILASH",SYSDATE(),2525)

SELECT * FROM TEST1
SELECT * FROM TEST2
SELECT * FROM TEST3

# AFTER INSERT.- EXAMPLE 1

DELIMITER //
CREATE TRIGGER TO_UPDATE_OTHERS1
AFTER INSERT ON TEST1 FOR EACH ROW
BEGIN
	UPDATE TEST2 SET C1 = "ABC" WHERE C1 = 'XYZ';
    DELETE FROM TEST3 WHERE C1 = "ABC";
END;//
SET SQL_SAFE_UPDATES = 0

INSERT INTO TEST1 VALUES("NEW",SYSDATE(),5216)

SELECT * FROM TEST1
SELECT * FROM TEST2
SELECT * FROM TEST3

# AFTER INSERT.- EXAMPLE 2
DELIMITER //
CREATE TRIGGER TO_UPDATE_OTHERS2
AFTER INSERT ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST2 VALUES("XYZ",SYSDATE(),2525);
    INSERT INTO TEST3 VALUES("ABC",SYSDATE(),5252);
END;//

INSERT INTO TEST1 VALUES("JIO",SYSDATE(),5216)
SELECT * FROM TEST1
SELECT * FROM TEST2
SELECT * FROM TEST3

# AFTER INSERT.- EXAMPLE 3

###### - RAMDOM EXAMPLE....
REATE TABLE TEST1(STU_NAME VARCHAR(30), SUBJ1 INT, SUBJ2 INT, SUBJ3 INT, TOTAL INT, PER DECIMAL(5,4))
CREATE TABLE TEST2(STU_NAME VARCHAR(30), SUBJ1 INT, SUBJ2 INT, SUBJ3 INT, TOTAL INT, PER DECIMAL(5,4))
SELECT * FROM TEST1
SELECT * FROM TEST2
INSERT INTO TEST1(STU_NAME,SUBJ1,SUBJ2,SUBJ3) VALUES("ABHILASH",89,90,95);

DELIMITER //
CREATE TRIGGER TEST_AFTER_TRIGGER
AFTER INSERT 
ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST2(SUBJ1,SUBJ2,SUBJ3) VALUES(NEW.SUBJ1,NEW.SUBJ2,NEW.SUBJ3);
END//

DELIMITER //
CREATE TRIGGER TEST_AFTER_TRIGGER2
AFTER INSERT 
ON TEST1 FOR EACH ROW
BEGIN
    INSERT INTO TEST2(TOTAL) VALUES(NEW.SUBJ1+NEW.SUBJ2+NEW.SUBJ3);
END//
#####


# AFTER DELETE.- EXAMPLE 1
DELIMITER //
CREATE TRIGGER TO_DELETE_OTHER_TABLE
AFTER DELETE ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST3 VALUES("KPMG",SYSDATE(),YEAR(sysdate()));
END;//

DELETE FROM TEST1 WHERE C1 = 'NEW'
SELECT * FROM TEST1
SELECT * FROM TEST3

# BEFORE DELETE.- EXAMPLE 1
DELIMITER //
CREATE TRIGGER TO_DELETE_OTHER_TABLE1
BEFORE DELETE ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST3 VALUES("KPMG",SYSDATE(),YEAR(sysdate()));
END;//

DELETE FROM TEST1 WHERE C1 = 'JIO'
SELECT * FROM TEST1
SELECT * FROM TEST3

# BEFORE DELETE.- EXAMPLE 2
DELIMITER //
CREATE TRIGGER BEFORE_DELETE1
BEFORE DELETE ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST3 SELECT * FROM TEST1 WHERE C1 = "ABC";
END;//

SELECT * FROM TEST1 

DELETE FROM TEST1 WHERE C1 = "ABC"

CREATE TABLE TEST11(
C1 VARCHAR(50),
C2 DATE,
C3 INT)

CREATE TABLE TEST12(
C1 VARCHAR(50),
C2 DATE,
C3 INT)

INSERT INTO TEST11 VALUES("ABHILASH",SYSDATE(),DAY(SYSDATE()));
INSERT INTO TEST11 VALUES
("SUDHANSHU",SYSDATE(),DAY(SYSDATE())),
("LUFFY",SYSDATE(),DAY(SYSDATE()))

SELECT * FROM TEST11
# BEFORE DELETE.- EXAMPLE 3
DELIMITER //
CREATE TRIGGER TO_DELETE_OBSERVATION
BEFORE DELETE ON TEST11 FOR EACH ROW
BEGIN
	INSERT INTO TEST12 VALUES(OLD.C1,OLD.C2,OLD.C3);
END;//

DELETE FROM TEST11 WHERE C1 = 'LUFFY'
SELECT * FROM TEST11
SELECT * FROM TEST12

# HERE WE ARE USING BEFORE DELETE, THE VALUES FROM TEST11 ARE INSERTED INTO TEST 12, BEFORE DELEATING THE PARTICULAR COLUMN.
# OLD.C1- REFERS TO PREVIOUSLY USED VALUES OF C1.

# AFTER DELETE.- EXAMPLE 1
DELIMITER //
CREATE TRIGGER TO_DELETE_OBSERVATION1
AFTER DELETE ON TEST11 FOR EACH ROW
BEGIN
	INSERT INTO TEST12 VALUES(OLD.C1,OLD.C2,OLD.C3);
END;//

DELETE FROM TEST11 WHERE C1 = 'ABHILASH'
SELECT * FROM TEST11
SELECT * FROM TEST12

# AFTER UPDATE.- EXAMPLE 1
DELIMITER //
CREATE TRIGGER TO_UPDATE_OBSERVATION1
AFTER UPDATE ON TEST11 FOR EACH ROW
BEGIN
	INSERT INTO TEST12 VALUES(OLD.C1,OLD.C2,OLD.C3);
END;//

SELECT * FROM TEST11

INSERT INTO TEST11 VALUES("SUDH",SYSDATE(),23456)

UPDATE TEST11 SET C1 = "GOMU" WHERE C1 = "SUDH"

SELECT * FROM TEST11
SELECT * FROM TEST12

# AFTER UPDATE.- EXAMPLE 2
DELIMITER //
CREATE TRIGGER TO_UPDATE_OBSERVATION2
AFTER UPDATE ON TEST11 FOR EACH ROW
BEGIN
	INSERT INTO TEST12 VALUES(NEW.C1,NEW.C2,NEW.C3);
END;//

UPDATE TEST11 SET C1 = "SUDH" WHERE C1 = "GOMU"

SELECT * FROM TEST11
SELECT * FROM TEST12

# CASE STATEMENTS...

use  ineuron_partition

SELECT * FROM ineuron_course1

SELECT * , CASE
	WHEN COURSE_NAME = "FSDA" THEN "THIS IS YOUR BATCH"
    ELSE "THIS IS NOT YOUR BATCH"
END AS STATEMENT FROM INEURON_COURSE1

# SIMILAR STATEMENT AS ABOVE, USING COMMON SYNTAX.
SELECT * , IF(COURSE_NAME = "FSDA","THIS IS YOUR BATCH","THIS IS NOT YOUR BATCH") AS STATEMENT FROM INEURON_COURSE1

SELECT * , CASE
	WHEN COURSE_NAME = "FSDA" THEN "THIS IS YOUR BATCH"
    WHEN COURSE_NAME = "FSDS" THEN "THIS IS YOUR BATCH"
    ELSE "THIS IS NOT YOUR BATCH"
END AS STATEMENT FROM INEURON_COURSE1

SELECT * , CASE
	WHEN COURSE_NAME = "FSDA" THEN "MENTOR- SUDH"
    WHEN COURSE_NAME = "FSDS" THEN "MENTOR- SUDH"
    WHEN COURSE_NAME = "BLOCKCHAIN" THEN "TULESKO"
    WHEN COURSE_NAME = "DATA ANALYTICS" THEN "KRISH"
    WHEN COURSE_NAME = "RL" THEN "KRISH"
    WHEN COURSE_NAME = "DL" THEN "SUNNY"
    WHEN COURSE_NAME = "FABE" THEN "HITESH"
    ELSE "MENTOR-UNKNOWN"
END AS STATEMENT FROM INEURON_COURSE1

SELECT * , CASE
	WHEN LENGTH(COURSE_NAME)= 4  THEN "LEN 4"
    WHEN LENGTH(COURSE_NAME)= 2 THEN "LEN 2"
    ELSE "LENGTH -UNKNOWN"
END AS STATEMENT FROM INEURON_COURSE1

SELECT * , CASE
	WHEN LENGTH(COURSE_NAME)>0 THEN LENGTH(COURSE_NAME)
    ELSE "0"
END AS COURSE_LENGTH FROM INEURON_COURSE1

SELECT DISTINCT(COURSE_NAME) , CASE
	WHEN LENGTH(COURSE_NAME)>0 THEN LENGTH(COURSE_NAME)
    ELSE "0"
END AS COURSE_LENGTH FROM INEURON_COURSE1

CREATE VIEW TEST_CASE AS SELECT * FROM INEURON_COURSE1

SET SQL_SAFE_UPDATES = 0
UPDATE TEST_CASE SET COURSE_NAME = CASE
	WHEN COURSE_NAME = "RL" THEN "REINFORCEMENT LEARNING"
	WHEN COURSE_NAME = "DL" THEN "DEEP LEARNING"
END

SELECT * FROM TEST_CASE

UPDATE TEST_CASE SET COURSE_NAME = CASE
	WHEN COURSE_NAME = "RL" THEN "REINFORCEMENT LEARNING"
	WHEN COURSE_NAME = "DL" THEN "DEEP LEARNING"
    ELSE "NONE"
END
