# Triggers
# TRIGGERS ARE USEED TO TRIGGER SOME ACTION BEFORE AOR AFTER FEW OPERATIONS LIKE INSERT, UPDATE, DELETE.
# THERE ARE 6 TYPES OF TRIGGERS, - BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, BEFORE DELETE, AFTER DELETE.
# WHEN EVER AN TRIGGER IS CREATED , BASED ON THE TYPE IT PERFORMS SOME OPERATION.
# WHEN AN BEFORE INSERT TRIGGER IS CREATED, WHEN EVER A DATA IS INSERTED TO AN TABLE, THE TRIGGER WILL BE ACTIVATED, BEFORE DATA INSERTION.

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

# BEFORE INSERT.
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

# AFTER INSERT.

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

DELIMITER //
CREATE TRIGGER TO_DELETE_OTHER_TABLE
AFTER DELETE ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST3 VALUES("KPMG",SYSDATE(),YEAR(sysdate()));
END;//

DELETE FROM TEST1 WHERE C1 = 'NEW'
SELECT * FROM TEST1
SELECT * FROM TEST3

DELIMITER //
CREATE TRIGGER TO_DELETE_OTHER_TABLE1
BEFORE DELETE ON TEST1 FOR EACH ROW
BEGIN
	INSERT INTO TEST3 VALUES("KPMG",SYSDATE(),YEAR(sysdate()));
END;//

DELETE FROM TEST1 WHERE C1 = 'JIO'
SELECT * FROM TEST1
SELECT * FROM TEST3

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

DELIMITER //
CREATE TRIGGER TO_DELETE_OBSERVATION1
AFTER DELETE ON TEST11 FOR EACH ROW
BEGIN
	INSERT INTO TEST12 VALUES(OLD.C1,OLD.C2,OLD.C3);
END;//

DELETE FROM TEST11 WHERE C1 = 'ABHILASH'
SELECT * FROM TEST11
SELECT * FROM TEST12

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

DELIMITER //
CREATE TRIGGER TO_UPDATE_OBSERVATION2
AFTER UPDATE ON TEST11 FOR EACH ROW
BEGIN
	INSERT INTO TEST12 VALUES(NEW.C1,NEW.C2,NEW.C3);
END;//

UPDATE TEST11 SET C1 = "SUDH" WHERE C1 = "GOMU"

SELECT * FROM TEST11
SELECT * FROM TEST12

# EXAMPLE FROM GEEKS FOR GEEKS.

mysql> desc Student; 
+-------+-------------+------+-----+---------+----------------+ 
| Field | Type        | Null | Key | Default | Extra          | 
+-------+-------------+------+-----+---------+----------------+ 
| tid   | int(4)      | NO   | PRI | NULL    | auto_increment | 
| name  | varchar(30) | YES  |     | NULL    |                | 
| subj1 | int(2)      | YES  |     | NULL    |                | 
| subj2 | int(2)      | YES  |     | NULL    |                | 
| subj3 | int(2)      | YES  |     | NULL    |                | 
| total | int(3)      | YES  |     | NULL    |                | 
| per   | int(3)      | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+ 
7 rows in set (0.00 sec)

create trigger stud_marks 
before INSERT 
on 
Student 
for each row 
set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100;

mysql> insert into Student values(0, "ABCDE", 20, 20, 20, 0, 0); 
Query OK, 1 row affected (0.09 sec) 

mysql> select * from Student; 
+-----+-------+-------+-------+-------+-------+------+ 
| tid | name  | subj1 | subj2 | subj3 | total | per  | 
+-----+-------+-------+-------+-------+-------+------+ 
| 100 | ABCDE |    20 |    20 |    20 |    60 |   36 | 
+-----+-------+-------+-------+-------+-------+------+ 
1 row in set (0.00 sec)

just go through the example..

# TRIED TO EXECUTE THE SAME , COULD NOT..
CREATE TABLE COURSE_NEW5(
COURSE_ID INT,
COURSE_DESC VARCHAR(50),
PRICE INT,
DISCOUNT INT,
DISCOUNT_PRICE DECIMAL(10,5));

SELECT * FROM COURSE_NEW5

DELIMITER //
CREATE TRIGGER TIG6
BEFORE INSERT ON COURSE_NEW5 FOR EACH ROW
BEGIN
	DECLARE VAL DECIMAL(10,5);
    SET VAL = DISCOUNT*PRICE;
	INSERT INTO COURSE_NEW5(DISCOUNT_PRICE) VALUE ( VAL);
END; //

INSERT INTO COURSE_NEW5(COURSE_ID,COURSE_DESC,PRICE,DISCOUNT) VALUES (101,"FSDA",4000,30);

CREATE TABLE COURSE_NEW1(
COURSE_ID INT,
COURSE_DESC VARCHAR(50),
COURSE_PRICE INT,
COURSE_DISCOUNT INT,
DISCOUNT_PRICE DECIMAL(10,5));

INSERT INTO COURSE_NEW1(COURSE_ID,COURSE_DESC,COURSE_PRICE,COURSE_DISCOUNT,DISCOUNT_PRICE) VALUES (101,"FSDA",4000,30,0)
#####


# CASE


