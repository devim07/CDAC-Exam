CREATE TABLE TEST
(
SRNO TINYINT,
FNAME VARCHAR(10),
LNAME VARCHAR(10),
SAL INT
);
INSERT INTO TEST VALUES
(1, 'DEVI', 'DINESH', 6250),
(2, 'BHAVYA', 'DINESH', 8000),
(3, 'MAHESH', 'KANOJIYA', 8500),
(4, 'DINESH', 'KESAVAN', 8500);
COMMIT;
INSERT INTO TEST VALUES
(5,'VANAJA', 'DINESH', 7000),
(6, 'SEVALAL', 'KANOJIYA', 8000);
SAVEPOINT ABC;
INSERT INTO TEST VALUES
(7, 'REMYA', 'IYER', 7000),
(8, 'MAHESWARI','MENON', 7000);
SAVEPOINT ABC;
SELECT * FROM TEST;
INSERT INTO TEST VALUES
(9, 'POONAM', 'KANOJIYA', 6500),
(10, 'ASHA', 'KANOJIYA', 5000);
ROLLBACK TO SAVEPOINT ABC;
SELECT * FROM TEST;
COMMIT;
SELECT CONCAT(CONCAT(FNAME,' '), LNAME) AS "FULL NAME" FROM TEST;
SELECT * FROM TEST WHERE LNAME='KANOJIYA' FOR UPDATE; 
COMMIT;
SELECT CONCAT(UPPER(SUBSTR(FNAME,1,1)), LOWER(SUBSTR(FNAME,2)),' ' , UPPER(SUBSTR(LNAME,1,1)), LOWER(SUBSTR(LNAME,2))) 
AS "FULL NAME" FROM TEST;
SELECT CONCAT(LPAD(SUBSTR(FNAME, 1, ROUND(LENGTH(FNAME)/2)), 20,'*'), 
RPAD(SUBSTR(FNAME, ROUND(LENGTH(FNAME)/2)+1),20,'*')) AS "CENTER JUSTIFIED" FROM TEST;
SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(FNAME, 'U',''), 'O',''), 'I',''), 'E',''),'A','') AS "WITHOUT VOWELS" FROM TEST;
SELECT FNAME FROM TEST
WHERE SOUNDEX('DEVI')=SOUNDEX('DIVI'); 
SELECT LPAD (FNAME,20, '*') FROM TEST;
CREATE TABLE EMPT
(
HIREDATE date
);
INSERT INTO EMPT VALUES
('2019-10-15'),
('2019-12-31'),
('2020-01-15');
SELECT SYSDATE() FROM DUAL;
SELECT NOW() FROM DUAL;
SELECT SYSDATE(), NOW(), SLEEP(5), SYSDATE(), NOW() FROM DUAL;
SELECT ADDDATE(SYSDATE(),0.5) FROM DUAL;
SELECT DATEDIFF(SYSDATE(), HIREDATE) FROM EMPT;
SELECT DATE_ADD(HIREDATE, INTERVAL 2 MONTH) FROM EMPT;
SELECT LAST_DAY(HIREDATE) FROM EMPT;
SELECT DAYNAME('1991-09-07') FROM DUAL;
SELECT ADDTIME(SYSDATE(),'1:30:00') FROM DUAL;
DROP TABLE EMPT;
CREATE TABLE EMPT
(
ENAME CHAR(1),
SAL INT,
COMM INT
);
INSERT INTO EMPT VALUE
('A', 5000, 500),
('B', 6000, NULL),
('C', NULL, 700);
SELECT * FROM EMPT
WHERE COMM IS NULL;
SELECT SAL+COMM FROM EMPT;
DROP TABLE EMPT;
create TABLE EMPT(
SAL INT,
DEPTNO TINYINT
);
INSERT INTO EMPT VALUES
(1000,10),
(2000,10),
(3000,20),
(4000,30),
(5000,40);
SELECT LEAST(SAL, 3000) FROM EMPT;
SELECT LEAST(SAL*0.1,350) AS "CASH BACK" FROM EMPT;
SELECT DEPTNO, CASE 
	WHEN DEPTNO=10 THEN 'TRAINING'
    WHEN DEPTNO=20 THEN 'EXPORTS'
    WHEN DEPTNO=30 THEN 'SALES'
   
    END
    AS "DEPT"
FROM EMPT;

SELECT DEPTNO, CASE
	WHEN DEPTNO=10 THEN SAL*12*0.4
    WHEN DEPTNO=20 THEN SAL*12*0.3
    WHEN DEPTNO=30 THEN SAL*12*0.2
	ELSE SAL*12*0.1
    END
    AS "HRA"
    FROM EMPT;
SELECT SAL, CASE
	WHEN SIGN(SAL-3000)=1 THEN 'HIGH INCOME'
    WHEN SIGN(SAL-3000)=-1 THEN 'LOW INCOME'
    ELSE 'NORMAL INCOME'
    END AS "REMARK"
FROM EMPT;
SELECT USER() FROM DUAL;
DROP TABLE EMPT;
CREATE TABLE EMPT(
EMPNO TINYINT,
ENAME VARCHAR(10),
SAL INT,
DEPTNO TINYINT,
JOB CHAR(1),
MGR TINYINT
);
INSERT INTO EMPT VALUES
(1, 'ARUN', 8000, 1, 'M',4),
(2, 'ALI', 7000, 1, 'C', 1),
(3, 'KIRAN', 3000, 1, 'C', 1),
(4, 'JACK', 9000, 2, 'M', NULL),
(5, 'THOMAS', 8000, 2, 'C', 4);
SELECT * FROM EMPT;
SELECT SUM(SAL) FROM EMPT;
SELECT AVG(IFNULL(SAL,0)) FROM EMPT;
DELETE FROM EMPT SAL WHERE EMPNO=4 ;
INSERT INTO EMPT VALUES

(4, 'JACK', NULL, 2, 'M', NULL);
SELECT MAX(IFNULL(SAL,0)) FROM EMPT;
SELECT COUNT(SAL) FROM EMPT;
INSERT INTO EMPT VALUES
(4, 'JACK', 9000, 2, 'M', NULL);
SELECT SUM(SAL) FROM EMPT WHERE DEPTNO=1;
SELECT AVG(SAL) FROM EMPT WHERE JOB='C' ;
SELECT COUNT(*) FROM EMPT WHERE SAL>7000;
SELECT ENAME, SUM(SAL) FROM EMPT;
SELECT SUM(SAL) WHERE DEPTNO=1 FROM EMPT;
SELECT JOB, SUM(SAL) FROM EMPT GROUP BY JOB;
SELECT DEPTNO, JOB, SUM(SAL) FROM EMPT
	GROUP BY JOB , DEPTNO;
SELECT DAYNAME(SYSDATE()) FROM DUAL;
SELECT * FROM EMPT;
SELECT ENAME, MAX(SAL)FROM EMPT;
SELECT DEPTNO, SUM(SAL) FROM EMPT
GROUP BY DEPTNO
HAVING COUNT(*)=3;
SELECT MAX(SUM_SAL) FROM 
(SELECT SUM(SAL) AS SUM_SAL FROM EMPT
GROUP BY DEPTNO) AS TEMP;

SELECT DEPTNO, COUNT(*), MIN(SAL), MAX(SAL) FROM EMPT
GROUP BY DEPTNO;
SELECT * FROM EMPT;
CREATE TABLE DEPT(
DEPTNO TINYINT,
DNAME CHAR(3),
LOC CHAR(3)
);

INSERT INTO DEPT VALUES
(1,'TRN', 'MUM'),
(2, 'EXP', 'DLH'),
(3, 'MKT', 'CAL');

SELECT DNAME,  ENAME FROM EMPT RIGHT OUTER JOIN DEPT
ON (DEPT.DEPTNO=EMPT.DEPTNO)
UNION
SELECT DNAME,  ENAME FROM EMPT LEFT OUTER JOIN DEPT
ON (DEPT.DEPTNO=EMPT.DEPTNO);
SELECT * FROM EMPT;

SELECT A.ENAME AS "EMPLOYEE", B.ENAME AS "REPORTING MANAGER" FROM EMPT B, EMPT A
WHERE A.MGR=B.EMPNO;

CREATE TABLE EMPH
(
HIREDATE date
);
INSERT INTO EMPH VALUES
('2019-10-15'),
('2019-12-31'),
('2020-01-15');

SELECT DATEDIFF(DAY,SYSDATE(),HIREDATE) AS "DATE" FROM EMPH;
SELECT SYSDATE() FROM DUAL;

SELECT * FROM EMPT;
CREATE TABLE DHEAD(
DEPTNO TINYINT,
DHEAD VARCHAR(15)
);

INSERT INTO DHEAD VALUES
(1,'ARUN'),
(2, 'JACK');

SELECT DNAME, DHEAD, ENAME FROM EMPT, DEPT, DHEAD
WHERE DEPT.DEPTNO=DHEAD.DEPTNO 
AND DHEAD.DEPTNO=EMPT.DEPTNO;

SELECT * FROM EMPT
WHERE SAL=
(SELECT MIN(SAL) FROM EMPT);

SELECT * FROM EMPT
WHERE SAL=
(SELECT MAX(SAL) FROM EMPT
WHERE SAL<
(SELECT MAX(SAL) FROM EMPT));

SELECT * FROM EMPT 
WHERE DEPTNO=
(SELECT DEPTNO FROM EMPT
WHERE ENAME='THOMAS');

SELECT * FROM EMPT 
WHERE JOB!=
	(SELECT JOB FROM EMPT
    WHERE ENAME='KIRAN');
COMMIT;
SAVEPOINT ABC;
DELETE FROM EMPT
WHERE DEPTNO=
(SELECT TEMP.DEPTNO FROM
(SELECT DEPTNO FROM EMPT 
WHERE ENAME='ARUN') AS TEMP);

ROLLBACK TO ABC;
INSERT INTO EMPT VALUES
(1, 'ARUN', 8000, 1, 'M',4),
(2, 'ALI', 7000, 1, 'C', 1),
(3, 'KIRAN', 3000, 1, 'C', 1);

SELECT * FROM EMPT;

SELECT * FROM EMPT WHERE JOB='M' AND SAL=ANY
(SELECT SAL FROM EMPT
WHERE JOB ='M');
SAVEPOINT ABC;
UPDATE EMPT SET SAL=13000
WHERE ENAME='KIRAN';

SELECT * FROM EMPT;

UPDATE EMPT SET SAL=3000
WHERE SAL=13000;

SELECT * FROM EMPT WHERE
SAL>
(SELECT MAX(SAL) FROM EMPT
WHERE JOB='M');

ROLLBACK WORK TO ABC; 

SELECT DNAME, SUM(SAL) FROM EMPT, DEPT
WHERE DEPT.DEPTNO=EMP.DEPTNO
HAVING SUM(SAL)=
(SELECT MAX(SUM) FROM 
(SELECT SUM(SAL) AS "SUM" FROM EMPT
GROUP BY DEPTNO)AS TEMP);

SELECT DNAME FROM DEPT
WHERE DEPTNO NOT IN
(SELECT DISTINCT DEPTNO FROM EMPT);

SELECT DISTINCT DNAME FROM EMPT, DEPT
WHERE EMPT.DEPTNO=DEPT.DEPTNO;

SELECT DNAME FROM DEPT WHERE EXISTS
(SELECT DEPTNO FROM EMPT
WHERE DEPT.DEPTNO=EMPT.DEPTNO);

CREATE TABLE EMP1
(
EMPNO TINYINT,
ENAME VARCHAR(2)
);
INSERT INTO EMP1 VALUES
(1,'A'),
(2,'B'),
(3,'C');
CREATE TABLE EMP2
(
EMPNO TINYINT,
ENAME VARCHAR(2)
);
INSERT INTO EMP2 VALUES
(1,'A'),
(2,'B'),
(4,'D'),
(5,'E');

SELECT EMPNO, ENAME FROM EMP1
UNION
SELECT EMPNO, ENAME FROM EMP2;

RENAME TABLE EMP3 TO EMP1;
SELECT * FROM EMP1;

ALTER TABLE EMP1 ADD GST FLOAT;
ALTER TABLE EMP1 DROP COLUMN GST;
ALTER TABLE EMP1 MODIFY ENAME VARCHAR(10);

