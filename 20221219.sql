/*
���Ἲ ���� ����

 ���Ἲ : �����ͺ��̽� ���� �������� Ȯ�强�� �����ϴ°��� �ǹ��Ѵ�.
         �ٶ������� ���� �����Ͱ� ����Ǵ� ���� �����ϴ� ���� ���Ѵ�.
         
 NOT NULL   : NULL���� ������� �ʴ´�.
 UNIQUE     : �ߺ��� ���� ������� �ʴ´�.
 PRIMARY KEY : NOT NULL + UNIQUE
 FOREIGN KEY : �����Ǵ� ���̺��� �÷��� ���� �����ϸ� �����
 CHECK       : ���� ������ �����Ͱ��� ������ ������ �����Ͽ� ������ ������ ����Ѵ�.
 */
 
 SELECT * FROM TAB;
 
 DROP TABLE EMP04;
 
 PURGE RECYCLEBIN;
 
 
 CREATE TABLE EMP01 (
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10),
 JOB VARCHAR2(9),
 DEPTNO NUMBER(4)
 );
 
 INSERT INTO EMP01 VALUES (NULL,NULL,'SALESMAN',30);
 SELECT * FROM EMP01;
 
 -- �����ȣ,�����,����,�μ���ȣ�� �����ϵ�, �����ȣ�� ������� NOT NULL������ ����
 
 CREATE TABLE EMP02 (
 EMPNO NUMBER(4) not NULL,
 ENAME VARCHAR2(10)not NULL,
 JOB VARCHAR2(9),
 DEPTNO NUMBER(4)
 );
INSERT INTO EMP02 VALUES (NULL,NULL,'SALESMAN',30);
INSERT INTO EMP02 VALUES (7499,'ALLEN','SALESMAN',20);
INSERT INTO EMP02 VALUES (7499,'STUDENT','MANAGER',20);

SELECT * from emp02;

CREATE TABLE EMP03 (
 EMPNO NUMBER(4) UNIQUE,
 ENAME VARCHAR2(10)not NULL,
 JOB VARCHAR2(9),
 DEPTNO NUMBER(4)
 );
 
INSERT INTO EMP03 VALUES (7499,'ALLEN','SALESMAN',30);
INSERT INTO EMP03 VALUES (7499,'STUDENT','MANAGER',20);
INSERT INTO EMP03 VALUES (NULL,'JONES','MANAGER',20);

CREATE TABLE emp04 (
 EMPNO NUMBER(4) PRIMARY KEY,
 ENAME VARCHAR2(10)not NULL,
 JOB VARCHAR2(9),
 DEPTNO NUMBER(4)
 );
 
 INSERT INTO emp04 VALUES (7499,'ALLEN','SALESMAN',30);
INSERT INTO emp04 VALUES (7499,'STUDENT','MANAGER',20);
INSERT INTO emp04 VALUES (NULL,'JONES','MANAGER',20);

SELECT * from emp04;
SELECT  CONSTRAINT_NAME,CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINT WHERE TABLE_NAME ='EMP04';
--        ���� ���Ǹ�       ������������         ���������� ���� ���̺���
/*

    CONSTRAINT_TYPE
    P      :  PRIMARY KEY
    R      :  FOREIGN KEY
    U      :  UNIQUE
    C      :  CHECK NOT NULL - NOT NULL�� CHECK
*/

SELECT * FROM user_cons_columns WHERE TABLE_NAME='EMP04'; 
SELECT * FROM EMP04;

/*
 ���� ���Ἲ�� ���� FROEIGN KEY ���� ����
 ���� ���Ἲ�� �� ���̺� ������ ���� ���迡�� �����ȴ�.

 ���� �����ؾ��ϴ� ���̺� (�� : �θ����̺�)
 �̸� �����ϴ� ���̺��� (�� : �ڽ����̺�)

 �μ�    -     < �Ҽ� >     -      ���

*/

SELECT  CONSTRAINT_NAME,CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINT WHERE TABLE_NAME ='DEPT';
DESC DEPT;
SELECT * FROM user_cons_columns WHERE TABLE_NAME='DEPT'; 

CREATE TABLE DEPT01 (
DEPTNO NUMBER(2) PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);
SELECT * FROM user_cons_columns WHERE TABLE_NAME='DEPT01'; 
SELECT * FROM DEPT;
INSERT INTO DEPT01 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT01 VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT01 VALUES(40,'OPERATIONS','BOSTON');

CREATE TABLE emp05 (
 EMPNO NUMBER(4) PRIMARY KEY,
 ENAME VARCHAR2(10)not NULL,
 JOB VARCHAR2(9),
 DEPTNO NUMBER(4) REFERENCES DEPT01(DEPTNO)
 );
 DROP TABLE DEPT01;
 
select * from emp05;
INSERT INTO emp05 VALUES (7499,'ALLEN','SALESMAN',30);
-- �ܷ� KEY
INSERT INTO emp05 VALUES (7566,'JONES','MANAGER',50);
SELECT * FROM DEPT01;
SELECT  CONSTRAINT_NAME,CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINT WHERE TABLE_NAME ='EMP05';
SELECT * FROM user_cons_columns WHERE TABLE_NAME='EMP05';

/*
 CHECK ���� ����
 �Էµ� ���� üũ�Ͽ� ���� �� �� �̿��� ���� ������ �����޽����� �Բ� ������ ������� ���ϰ� �ϴ� ���� �ǹ��Ѵ�.
*/
-- EMP06 ��� ���̺��� GENDER(����) �÷��� �߰��ϵ� GENDER�÷����� 
-- 'M','F'�� �ΰ��� �����Ҽ� GHECK ���� ���� ����

CREATE TABLE EMP06(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
GENDER VARCHAR2 (1) CHECK(GENDER IN('M','F'))
);
INSERT INTO emp06 VALUES (7566,'JONES','M');
SELECT  CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM user_constraints WHERE TABLE_NAME ='EMP06';
SELECT * FROM user_cons_columns WHERE TABLE_NAME='EMP06';

/*
���� ���Ǹ�  �����ϱ�
 ����ڰ� �ǹ� �ְ� ���� ���Ǹ��� �����Ͽ� ���� ���Ǹ������ε� � ���������� ���� �ߴ���
 �˼� �ְ� �����ϴ� ����̴�.
 
 ���� ���� ���ù�
 �÷���, ������, Ÿ��, ��������, ���������̸�, ��������Ÿ��
 
 ���� ���Ǹ� ��Ģ
 ���̺���_�÷���_������������
 
 EMP06_EMPNO_PK
 ���̺��� �÷��� ������������
*/
DROP TABLE EMP07;
CREATE TABLE emp07 (
 EMPNO NUMBER(4), 
 ENAME VARCHAR2(10),
 JOB VARCHAR2(9),
 DEPTNO NUMBER(2),
 PRIMARY KEY(DEPTNO),
 UNIQUE (JOB),
/*
 CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY,
 CONSTRAINT EMP07_EMPNO_NN NOT NULL
 CONSTRAINT EMP07_JOB_UK UNIQUE,
 CONSTRAINT EMP07_DEPTNO_FK FOREIGN KEY(DEPTNO) not REFERENCES DEPT01(DEPTNO)
*/
 INSERT INTO EMP07 VALUES(7499,'ALLEN','SALASMAN',30);
 INSERT INTO EMP07 VALUES(7450,'ALLEN','MANAGER',50);
 EMP07_DEPTNO REFERENCES
 
 SELECT  CONSTRAINT_NAME,CONSTRAINT_TYPE, TABLE_NAME,R_CONSTRAINT NAME
 FROM USER_CONSTRAINTS WHERE TABLE_NAME ='EMP07';

SELECT * FROM user_cons_columns WHERE TABLE_NAME ='EMP07';
 INSERT INTO EMP07 VALUES(7499,'ALLEN','SALASMAN',30);
 INSERT INTO EMP07 VALUES(7499,'NULL','SALASMAN',30);

 SELECT * FROM USER_CONS_SOLUMNS WHERE 
 
 SELECT * FROM EMP01;
 DELETE FROM EMP01;