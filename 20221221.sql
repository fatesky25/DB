create sequence emp_seq
start with 1
increment by -10
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
SELECT SEQUENCE_NAME, MIN_VALUE,MAX_VALUE, INCREMENT_BY, CYCLE_FLAG FROM user_sequences;

SELECT emp_seq.nextval from dual;

/*
NEXTVAL, CURVAL �� ����Ҽ� �ִ� ���
1. ���������� �ƴ� SELECT ��
3. INSERT ���� SELECT ��
4. INTSERT VALUES���� ���
5. UPDATE ���� SET��

NEXTVAL, CURVAL �� ����Ҽ� ���� ���
1. VIEW�� SELECT��
3. DISTINCT Ű���尡 �ִ� SELECT��
4. GROUP BY, HAVING, ORDER BY���� �ִ� SELECT��
5. SELECT, DELETE, UPDATE�� ��������
6. CREATE TABLE, ALTER TABLE ���

������ ���� �����Ϸ��� ALTER SEQUENCE

 ALTER SEQUENCE EMP_SEQ
 START WITH N
 INCREMENT BY N
 MAXVALUE N / NOMAXVALUE
 MINVALUE N / NOMINVALUE
 CYCLE /  NOCYCLE
 CACHE / NOCACHE;
*/

alter sequence emp_seq
increment by 10
maxvalue 1000000;

--------------------------------------------------------------------------------

CREATE VIEW view_emp10
as SELECT empno, ename, hiredate from emp
where deptno=10;

SELECT * from view_emp10;

/*
���� ����
 - ���ٶ� �ǹ̸� ���� �ִ� ���� �����ؼ� ���� ���̺� ����� �����͸� �並 ���ؼ� �����ִ�.
 - �並 ���� ���̺��̶�� ��, ���̺�� ���� �����ϰ� ���Ǳ� �����̴�.
 
 ��� �������� ������ ���̺�� �޸� ��������� ����.
 ��� ���� �������� �����ϰ� �ִ� ��ü��� ǥ���� �� �ִ�.
 
���� ������
 - �������� ���̺� ������ �����ϱ� ���� ����Ѵ�.
 - ������ ���Ǹ� ���� ����� ���ؼ� ���ȴ�.
 
���� Ư¡
 - ��� ���̺� ���� ������ ������ ���̺��� ������ �κи� ���� �� �ִ� ���� ���̺��̴�.
 - ��� ���� �����͸� ������ ������ ������,
 �並 ���ؼ� ���̺��� ������ �� �ִ�.
 �ϳ��� ���̺��� ���� ������ ������ ����.
 
 
 ��� CREATE���� �̿��Ͽ� �����Ѵ�.
 
 �⺻���̺�
     �信 ���� ���������� �����ؼ� ����ϴ� ���������� 
     �����͸� �����ϰ� �ִ� �������� ���̺��� �ǹ��Ѵ�.
*/

SELECT * from emp01;
drop table emp01;
CREATE table emp01
as SELECT * from emp;

select empno, ename, sal, deptno FROM emp01 where deptno=10;

/*
���� ����
��� ���̺� ó�� �ϳ��� ��ü�μ� ���̺� �����Ҷ��� �����ϰ� create view ������� �����Ѵ�.

CREATE [OR REPLACE][FORCE | NOFOCE] VIWE VIWE_NAME
AS SUBQUERY
[WITH CHECK OPTION]
[WITH READ ONLY];  -- �ش� �並 ���ؼ��� SELECE�� ���ϴ�.
INSERT/UPDATE,DELETE ��ɾ�� ����Ҽ� ����.

 OR REPLACE
 - ���ο� �並 ����� ���� �Ӹ� �ƴ϶� ������ �䰡 �����ϴ��� ���������ʰ� ���ο�
   ������ ��� ������ �ִ�.
 FORCE | NOFOCE
 - �⺻���̺��� ���翩�ο� ������� �並 �����Ѵ�.
 WITH CHECK OPTION
 - �ش� �並 ���ؼ� �� �� �ִ� ���� �������� UPDATE OR INSERRT ����� �����ϴ�.
 WITH READ ONLY]

���� ���� ����
 - ����ڰ� �信 ���ؼ� ���Ǹ� �ϸ� user_view���� �信���� ��ȸ�� �Ҽ��ִ�.
 - �⺻ ���̺� ���� ���� ������ ���ɴ�.
 - �信 ���� ���Ǹ� �⺻ ���̺����� ���Ƿ� ��ȯ��
 - �⺻ ���̺� ���� ���Ǹ� ���ؼ� �����͸� �˻���
 - �˻��� ����� ���
 
 ���� ����
   �⺻ ���̺��� ���� ���� �ܼ���� ���պ�� ��������
   
        �ܼ���                       ���պ�
   �ϳ��� ���̺�� ����           ���� ���� ���̺�� ����
   �׷��Լ� ��� �Ұ�             �׷� �Լ� ��� ����
   Distinct ����� �Ұ���        Distinct����� ����
   DML(����,����,����) ��밡��       DML ��� �Ұ�
 
*/

SELECT view_name, text from user_views;

drop VIEW view_emp10;
SELECT * from view_emp10;

CREATE VIEW view_emp10
as SELECT empno, ename, sal, deptno from emp01
where deptno=10;

-- �ܼ���

insert into view_emp10 values(8000,'angel','7000',10);
delete from view_emp10 where empno=8000;
-- �ܼ��並 ������� ���� dml ��ɹ��� ó�� ����� �並 �����Ҷ� ����� �⺻���̺� ������  ��ģ��.

SELECT * from emp01;
desc view_emp10;

-- �ܼ� ���� �÷��� ��Ī ����ϱ�
CREATE OR REPLACE view view_emp(�����ȣ,�����,�޿�,�μ���ȣ)
as SELECT empno, ename, sal, deptno from emp01;

SELECT * from view_emp;

-- �׷��Լ��� ����� �ܼ���
-- �μ��� �޿� �Ѿװ� ����� ���ϴ� �۾��� ��� ������ ���� ����ϱ� ����
CREATE view view_sal
as SELECT deptno, sum(sal) as "SalSum", avg(sal) as "SalAvg" from emp01
group by deptno;

SELECT * from view_sal;

-- ���պ� : �� �� �̻��� �⺻ ���̺� ���� ������ ��

SELECT * from dept01;
SELECT * from emp01;

CREATE table dept01
as
SELECT * from dept;

CREATE view view_emp_dept
as
SELECT e.empno, e.ename, e.sal, e.deptno, d.dname,d.loc
from emp01 e, dept01 d
where e.deptno = d.deptno
order by empno desc;
SELECT * from view_emp_dept;

SELECT view_name, text from user_views;
drop view view_sal;

CREATE or REPLACE view view_emp10
as
SELECT empno, ename, sal, comm, deptno from emp01
where deptno=10;

create or replace force view view_nottable
as
select empno, ename, deptno
from aaaa
where deptno=10;

select * from view_notable;
select * from aaaa;

-- with check option
-- �� ������ �������� ������ �÷� ���� �������� ���ϵ��� �ϴ°��� �ǹ��Ѵ�.
create or replace view view_chk20
as
select empno, ename, sal, comm, deptno from emp01
where deptno=20 with check option;

select * from view_chk20;

-- �޿��� 5000�̻��� ����� 10���μ� �̵��ϴ� �������� �ۼ��Ͻÿ�.
update view_chk20 set deptno=10
where sal >=5000;

select * from view_chk20;

-- WITH READ ONLY
-- �並 ���ؼ��� �⺻���̺��� � �÷��� ���ؼ��� ������ ���� �����Ҽ������� �ϴ°��� �ǹ��Ѵ�.
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp01
where deptno=30 WITH READ ONLY;

select * from view_read30;
update view_read30 set comm=1000;

/*
with check option
  - ���ǿ� ����� �÷��� ���� �������� ���ϰ� �ϴ°�
WITH READ ONLY
  - �⺻ ���̺��� ��θ� �������� ���ϰ� �ϴ� ��
*/