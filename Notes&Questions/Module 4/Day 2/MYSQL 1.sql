CREATE TABLE SEMP
(
EMPNO CHAR(4),
EMPNAME VARCHAR(20),
BASIC FLOAT,
DEPTNO CHAR(2),
DEPTHEAD CHAR(4)
);
CREATE TABLE SDEPT
(
DEPTNO CHAR(2),
DEPTNAME VARCHAR(15)
);
INSERT INTO SDEPT VALUES
('10', 'Development'),
('20','Training');
INSERT INTO SEMP VALUES
('0001','SUNIL',6000,'10',NULL),
('0002','HIREN',8000,'20', NULL),
('0003','ALI',4000,'10','0001');
INSERT INTO SEMP VALUES
('0004','GEORGE',6000,NULL, '0002');
CREATE TABLE S
(
`S#` CHAR(3),
SNAME VARCHAR(20),
`STATUS` TINYINT,
CITY VARCHAR(15)
);
DROP TABLE S;
CREATE TABLE S
(
`S#` CHAR(3),
SNAME VARCHAR(20),
`STATUS` TINYINT,
CITY VARCHAR(15)
);
CREATE TABLE P
(
`P#` CHAR(3),
PNAME VARCHAR(20),
COLOR VARCHAR(15),
WEIGHT FLOAT,
CITY VARCHAR(15)
);
CREATE TABLE J
(
`J#` CHAR(3),
JNAME VARCHAR(20),
CITY VARCHAR(15)
);
DROP TABLE J;
DROP TABLE SPJ;
CREATE TABLE SPJ
(
`S#` CHAR(3),
`P#` CHAR(3),
`J#` CHAR(3),
QTY INT
);
INSERT INTO S (`S#`, SNAME, `STATUS`, CITY) VALUES
('S1', 'ARJUN', 10 ,'LONDON'),
('S2', 'ANIL', 10,'PARIS'),
('S3', 'ANURAJ', 40,'ATHENS'),
('S4', 'ATUL', 10,'BERLIN'),
('S5', 'VIPUL', 20 ,'LONDON'),
('S6', 'RAMESH', 50,'ATHENS'),
('S7', 'SURESH', 30,'PARIS'),
('S8', 'GOVIND', 10 ,'LONDON'),
('S9', 'SUBODH', 30,'BERLIN'),
('S10', 'KAPIL', 10,'ATHENS');
DROP TABLE P;
INSERT INTO P (`P#`, PNAME, COLOR, WEIGHT, CITY) VALUES
('P1', 'PRT 1', 'BLUE',2.5 , 'ATHENS'),
('P2', 'PRT 2', 'RED', 1 , 'PARIS'),
('P3', 'PRT 3', 'YELLOW', 3.25 , 'LONDON'),
('P4', 'PRT 6', 'GREEN', 0.5, 'PARIS'),
('P5', 'PRT 4', 'WHITE', 4, 'ATHENS'),
('P6', 'PRT 5', 'BLUE',2.5 , 'BERLIN'),
('P7', 'PRT 9', 'YELLOW', 7.1 , 'PARIS'),
('P8', 'PRT 8', 'BLACK',2 , 'BERLIN'),
('P9', 'PRT 7', 'RED', 3.5, 'ATHENS'),
('P10', 'PRT 10', 'BLUE', 4, 'LONDON');

INSERT INTO J VALUES
('J1', 'PROJ 1', 'LONDON'),
('J2', 'PROJ 2', 'ATHENS'),
('J3', 'PROJ 3', 'PARIS'),
('J4', 'PROJ 4', 'BERLIN'),
('J5', 'PROJ 6', 'BERLIN'),
('J6', 'PROJ 5', 'LONDON');
DROP TABLE J;

SELECT * FROM J;
SELECT `S#`, SNAME FROM S;
SELECT PNAME, COLOR FROM P
WHERE CITY="LONDON";
SELECT * FROM S WHERE CITY="LONDON";
SELECT * FROM S WHERE CITY="PARIS" OR CITY="ATHENS";
SELECT * FROM P WHERE CITY="ATHENS";
SELECT * FROM P;
SELECT PNAME FROM P WHERE WEIGHT>=2 AND WEIGHT <=4;
SELECT SNAME FROM S WHERE `STATUS`>=20;
SELECT SNAME FROM S WHERE CITY != 'LONDON';
SELECT DISTINCT CITY FROM S;
SELECT WEIGHT, WEIGHT*1000 AS "WEIGHT IN MILLI-GRAMS" FROM P; 
SELECT WEIGHT, WEIGHT/1000 AS "WEIGHT IN KG" FROM P;
SELECT WEIGHT, WEIGHT*100 AS"WEIGHT IN MG", WEIGHT/1000 AS "WEIGHT IN KG" FROM P;

sELECT * FROM S;
INSERT INTO S VALUES
('S20', 'DEVI', 20, 'MUMBAI'),
('S21','BHAVYA', 30, 'MUMBAI');

SELECT NEWSTATUS, COUNT(NEWSTATUS) FROM 
(SELECT CASE
	WHEN `STATUS`=10 THEN 'TEN'
    WHEN `STATUS`=20 THEN 'TWENTY'
    WHEN `STATUS`=30 THEN 'THIRTY'
    WHEN `STATUS`=40 THEN 'FOURTY'
    WHEN `STATUS`=50 THEN 'FIFTY'
    END AS "NEWSTATUS"
    FROM S) AS X
group by NEWSTATUS;

SELECT * FROM SPJ;
INSERT INTO SPJ VALUES
('S1','P2','J1',50),
('S2','P3','J2',70),
('S3','P4','J3',100),
('S4','P5','J3',250),
('S5','P5','J4',450),
('S5','P6','J5',360),
('S5','P7','J6',500),
('S6','P5','J1',150),
('S7','P7','J2',220),
('S8','P9','J3',570),
('S9','P10','J4',300),
('S10','P1','J5',90),
('S10','P1','J6',290),
('S1','P2','J1',420),
('S3','P5','J2',300);

SELECT SNAME, SUM(QTY) FROM SPJ, S
WHERE SPJ.`S#`=S.`S#`
GROUP BY SPJ.`S#`;

SELECT PNAME, SUM(QTY) FROM SPJ, P
WHERE P.`P#`=SPJ.`P#`
GROUP BY P.`P#`
ORDER BY PNAME;

SELECT JNAME , SUM(QTY) FROM SPJ, J
WHERE SPJ.`J#`=J.`J#`
GROUP BY J.`J#`
ORDER BY JNAME;

SELECT SNAME, PNAME, JNAME, QTY FROM SPJ, S, P, J
WHERE SPJ.`J#`=J.`J#`
AND SPJ.`S#`=S.`S#`
AND SPJ.`P#`=P.`P#`
ORDER BY SNAME, PNAME, JNAME;

SELECT SNAME, PNAME, J.CITY FROM S, P, SPJ, J
WHERE SPJ.`P#`=P.`P#` AND SPJ.`S#`=S.`S#` AND SPJ.`J#`=J.`J#`
AND J.CITY 
AND DISTINCT CITY
ORDER BY CITY, SNAME, PNAME;

SELECT PNAME, SUM(QTY) FROM SPJ, P
WHERE P.`P#`=SPJ.`P#`
AND P.`P#` 
AND COLOR='RED'
GROUP BY PNAME;

SELECT SNAME, SUM(QTY) FROM SPJ, S
WHERE SPJ.`S#`=S.`S#` 
AND `STATUS`=20
GROUP BY SNAME;

SELECT PNAME, SUM(QTY) FROM SPJ, P
WHERE SPJ.`P#`=P.`P#`
AND WEIGHT>1.4
GROUP BY PNAME
ORDER BY PNAME;

SELECT JNAME, CITY, QTY FROM SPJ, J
WHERE J.`J#`=SPJ.`J#`
AND QTY>500
ORDER BY JNAME;

SELECT PNAME, SUM(QTY) FROM SPJ, P
WHERE P.`P#`=SPJ.`P#`
AND WEIGHT<1.5
GROUP BY PNAME
ORDER BY PNAME;


SELECT SNAME FROM S
WHERE `STATUS`=
(SELECT `STATUS` FROM S
WHERE SNAME='ARJUN');

SELECT * FROM P
WHERE WEIGHT >
(SELECT MAX(WEIGHT) FROM P
WHERE COLOR='RED');

SELECT * FROM J 
WHERE CITY=
(SELECT CITY FROM J
WHERE JNAME='PROJ 4');

SELECT * FROM P
WHERE WEIGHT<
(SELECT MIN(WEIGHT) FROM P
WHERE COLOR='GREEN');

SELECT SNAME FROM SPJ, S
WHERE S.`S#`=SPJ.`S#`
AND QTY=
(SELECT MAX(QTY) FROM SPJ);

SELECT NAME FROM EMP
WHERE SAL=
(SELECT MIN(SAL) FROM EMP);

SELECT A.ENAME AS EMPLOYEE, B.ENAME AS MANAGER FROM EMPT A, EMPT B
WHERE A.MGR=B.EMPNO;

SELECT SNAME, SUM(QTY) FROM SPJ, S
WHERE SPJ.`S#`=S.`S#`
GROUP BY SNAME
HAVING SUM(QTY)=
(SELECT MAX(SUM) FROM
(SELECT SUM(QTY) AS "SUM" FROM SPJ
GROUP BY `S#`)AS TEMP);

SELECT DNAME , COUNT(EMPNO) AS "TOTAL EMP" FROM DEPT, EMPT
WHERE DEPT.DEPTNO=EMPT.DEPTNO
GROUP BY DNAME
HAVING COUNT(EMPNO)=
(SELECT MAX(TOTAL) FROM
(SELECT COUNT(EMPNO) AS "TOTAL" FROM EMPT
GROUP BY DEPTNO) AS TEMP);