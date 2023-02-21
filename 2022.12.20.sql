SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM user_constraints WHERE TABLE_NAME='DEPT01';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM user_constraints WHERE TABLE_NAME='EMP01';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM user_constraints WHERE TABLE_NAME IN ('DEPT01','EMP01');

SELECT * from EMP01;
SELECT * from DEPT01;

-- DEPT01 ���̺��� �⺻Ű�� ��Ȱ��ȭ �Ѵ�.

ALTER TABLE DEPT01
DISABLE PRIMARY KEY;
-- DEPT01 ���̺��� �⺻Ű�� EMP01���̺��� �ܷ�Ű���� �����ϰ� �ֱ� ������
-- ���������� ��Ȱ��ȭ �� �� ����.
ALTER TABLE EMP01
DISABLE PRIMARY KEY;

-- �θ����̺�� �ڽ����̺��� ���ÿ� ��Ȱ��ȭ
ALTER TABLE DEPT01
DISABLE PRIMARY KEY CASCADE;
ROLLBACK;

-- �θ����̺�� �ڽ����̺��� ���ÿ� ��Ȱ��ȭ
ALTER TABLE EMP01
DISABLE PRIMARY KEY;

ALTER TABLE DEPT01
DROP PRIMARY KEY CASCADE;
ROLLBACK;

/*
 ����
 - �� �� �̻��� ���̺��� ���ϴ� ����� ��� ���� ���
 
   Equi Join       : ������ �÷��� �������� �����Ѵ�.
   Non Equi Join   : ������ �÷��� ���� �ٸ� ������ ����Ͽ� ����
   Outer Join      : ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ����.
   Self Join       : �� ���̺� ������ �����Ѵ�.
   emp a, emp b
*/

SELECT ENAME , DNAME FROM EMP01,DEPT01 WHERE emp01.deptno=dept01.deptno;

-- Non Equi Join�� ������ ���̺� ���̿� �÷��� ���� ���������� ��ġ���� ���� ��
-- ����ϴ� �������� '='�� ������ �����ڸ� ����Ѵ�.

SELECT * from salgrade;
SELECT * from emp01;

SELECT E.ENAME, E.SAL, S.GRADE FROM EMP E, salgrade S --��Ī���Ҷ��� FROM�ڿ��� ���ش�
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- Outer Join  : ���� ���� ���ǿ� �������� ���� ��� �� ���� ����� 
--               ��Ÿ���� �ʰ� �ȴ� �̶� ���� ���ǿ� �������� �ʴ� 
--               ��鵵 ��Ÿ������

SELECT * from dept01;

SELECT e.ename, d.deptno, d.dname
FROM EMP E, DEPT D
where e.deptno(+)=d.deptno;

-- Ư�� ����� ����ϴ� �Ŵ��� ����� �̸��� ���
SELECT ename, mgr from emp;

SELECT work.ename"���", manager.ename "�Ŵ���"
from emp work, emp manager
WHERE work.mgr=manager.empno;

/*
��������
 ���������� �ϳ��� select ������ �� �ȿ� ���Ե� ���ϳ��� select���� �ǹ��Ѵ�.
 ����(��), ����(��)
*/

-- scott�� �μ����� �˾ƺ������Ѵ�.
SELECT deptno from emp where ename='SCOTT';

-- �μ���ȣ�� 20���̸� �μ��̸��� �˾� ���� �ִ�.
SELECT dname from dept;

SELECT dname FROM dept where deptno=20;

SELECT dname from dept where deptno=(-- ���� ����
SELECT deptno from emp where ename='SCOTT'); -- ���� ����

/*
������ �������� : ���� select�������κ��� ���� �ϳ��� �ุ�� ��ȯ�Ѵ�
               ��� ������ : �񱳿����� ���(>(�۴�),<(ũ��),<==(ũ�ų�����),>=(�۰ų�����),=(����),!=(�����ʴ�)<>)
������ �������� : ������������ ��ȯ�ϴ� ����� �ϳ� �̻��� ���϶��� �ǹ���
               ��� ������ : IN(||), (ANY, SOME(�������� ���� �ϳ��� �¾Ƶ� ��)), ALL(&&) , EXIST()
*/

/*
IN ������

�޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ��� �����Ѻμ����� �ٹ��ϴ� ����� ����Ͻÿ�.
*/

SELECT DISTINCT(deptno) deptno from emp where sal > = 3000;
SELECT ename, sal, deptno from emp;
-- ���� ����
SELECT ename, sal, deptno from emp where deptno in(SELECT DISTINCT(deptno) deptno from emp where sal > = 3000);

/*
ALL ������ : ���� ������ �� ������ ���������� �˻������ ��� ���� ��ġ�ϸ� ��

 0�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ����Ͻÿ�.
*/
SELECT ename,sal from emp where sal > 2850; -- ����
SELECT max (sal) from emp where deptno=30;  -- ����

SELECT ename,sal from emp where sal > all(SELECT max (sal) from emp where deptno=30);

/*
 ANY �����ڴ� ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻� ��ġ�ϸ� ��
 ��, ã���� ������ ���� ������(�ּҰ�)���� ũ�� ���̵ȴ�.

-- �μ���ȣ�� 30���� ������� �޿� �� ���� ������ ���� ���� �޿��� �޴� ����� �̸��� �޿��� ����Ͻÿ�.
*/

SELECT min(sal) from emp WHERE deptno=30; -- ��������
SELECT ename,sal from emp;
SELECT ename,sal from emp where sal > any(SELECT min(sal) from emp WHERE deptno=30);

CREATE table emp08 as SELECT * from emp;
drop table emp08;
desc emp;
SELECT * from emp08;
SELECT * from tab;
PURGE RECYCLEBIN;

-- ���̺��� ������ ����
-- 1=0 : �׻� �����̴�
CREATE table emp08 as SELECT * from emp where 1=0;

CREATE table dept02 as SELECT * from dept where 1=0;
drop table dept02;
SELECT * from dept02;
SELECT * from dept;
-- �߰��Ѵ�  deppt02��   dept��絥���͸�
INSERT into dept02 SELECT * from dept;

SELECT * from dept02;

/*
10�� �μ��� �������� 40�� �μ��� ���������� �����Ͻÿ�.
new york --> boston
*/

UPDATE dept02 set loc=(SELECT loc from dept02 where deptno=40)where deptno=10;
ROLLBACK;

/*
20�� �μ���� �������� 30�� �μ��� �μ���� ���������� �����Ͻÿ�.
*/

UPDATE dept02 set (dname,loc)= (SELECT dname,loc from dept02 where deptno=30)where deptno=20;

CREATE table emp09 as SELECT *from emp;

SELECT * from emp09;
SELECT deptno, dname from dept01;

-- �μ� ��ȣ �˻� : 30
SELECT deptno from dept01 where dname='SALES';

DELETE from emp09 where deptno=(SELECT deptno from dept01 where dname='SALES');

SELECT * from dept01;
delete from dept01 where deptno=20;
commit;
rollback;

-- commit �Ŀ��� rollback�� �ص� �ҿ��� ����.

/*
������
 �������� ������ �� ������ �ִ� ����Ŭ ��ü
 �������� �����ϸ� �⺻Ű�� ���� ���������� �����ϴ� �÷��� �ڵ������� �����Ҽ��ִ�.
 
 ����
 
 CREATE SEQUENCE ������ �̸�
 START WITH N
 INCREMENT BY N
 MAXVALUE N / NOMAXVALUE
 MINVALUE N / NOMINVALUE
 CYCLE /  NOCYCLE
 CACHE / NOCACHE;
 
 
 1. START WITH N 
    - �������� ���۰��� ������
    N �� 1�� �����ϸ� 1���� ���������� ����
 1-1. INCREMENT BY N
    - �������� �������� ������
    1�� �ϸ� 1�� �����ϰ� 2�� �ϸ� 2�� �����Ѵ�
 3. MAXVALUE N / NOMAXVALUE
    - �ִ밪���� / ���Ѵ�� ����
 4. MINVALUE N / NOMINVALUE
    - �ּҰ����� / ���Ѽҷ� ����
 5. CYCLE /  NOCYCLE
    - �ִ밪���� �����ϸ� �ٽ� �ּҰ����� �����ϵ��� ����
      �⺻���� NOCYCLE
 6. CACHE / NOCACHE;
    - ����Ŭ���� �̸� ������ ���� �޸� ��
      �⺻���� 2
*/

-- ���۰��� 1�̰� 1�� �����ϰ� �ִ밪�� 1000000�� �Ǵ� ������ EMP_SEQ�� �����Ͻÿ�.

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000000;
-- ������ ����

select * from emp;
drop sequence emp_seq;

drop table emp10;

create table emp10
as select empno, ename, hiredate from emp where 1=0;
-- ��� �ִ� ���̺� ����

insert into emp10 values(1, 'JULIA',sysdate);

insert into emp10 values(emp_seq.NEXTVAL,'JULIA',sysdate);
-- ������ �߰�

select * from emp10;

-- insert into emp10 values(emp_seq.currval, 'JULIA',sysdate);
-- insert into emp10 values(emp_seq.nextval, 'JULIA',sysdate);

select * from emp10;
select emp_seq.CURRVAL from dual;
-- ���� ���� ��ȯ�� : CURRVAL

select emp_seq.NEXTVAL from dual;
-- ���� �������� �������� ��ȯ�� : NEXTVAL

delete from emp10;

-- �������� Ȯ�� �ϴ� ���
SELECT SEQUENCE_NAME, MIN_VALUE,MAX_VALUE, INCREMENT_BY,


