/*
�÷��� ���� �Ҷ� ������ ���ִ� �ڷ���

char (n)    : �������� ���� ������, �ּ� ũ��� 1byte, �ִ�ũ��� 2000byte
varchar (n) : �������� ���� ������, �ּ� ũ��� 1byte, �ִ�ũ��� 4000byte
number      : ���ڸ� �����ϴ� ������, �ּ� ũ��� 1byte, �ִ�ũ��� 40byte
number (n)  : ������ n ������ �� ũ��
number (n,d): ������ nũ�⿡�� �Ҽ����� ������(d)
date        : ��¥�� �����ϴ� ������ ����
long (������ �ƴ�)  : �������� ���� ������ �ִ�ũ��� 2gbyte
rowid (���ڵ忡 ��Ÿ���� ���ȣ)    : db �� ����Ǿ� ���� ������ db �� �����͵� �ƴϴ�
*/

select * from emp;
desc emp;

/*
���̺� ��� �÷����� �����ϱ� ���� ��Ģ
  1. �ݵ�� ���ڷ� �����ؾ��Ѵ�.
  1-1. ���ڴ� 1~30���� ���� �����ϴ�
  3. ������ A~Z������ ��ҹ��� ���ڴ� 0~9������ ���� Ư������(_,#,$)������
  4. ������ ���Ұ�
  5. ������ ������
*/

-- �����ȣ, �����, �޿�, 3���� �÷����� ������ emp01���̺��� �ۼ��Ͻÿ�.
CREATE table emp01 (
--��� �÷� ����
empno number,
ename varchar2(10),
sal number(7,2)
);

select * from tab;

--��� ���̺��� ����
desc emp01;

select * from emp01;
desc emp02;

--��� ���̺� ����
create table emp02
as select * from emp;

select * from tab;

--��� ���̺� ����
drop table emp02;
PURGE table emp01;
SELECT * from tab;

/*
alter table : ���̺� ���� ����
alter table ��ɾ�� ���̺��� �÷��� �߰�, ����, Ÿ���̳� ���̸�  �����Ҷ� �����

add column    : ���ο� �÷��� �߰�
modify column : ���� �÷��� �����Ҷ� �����
drop column   :  �÷��� �����Ѵ�

����
 alter table ���̺��
 add (�÷���, ������Ÿ��);
 
�ش� �÷��� �����Ͱ� ���� ���
 - ���� �÷� ����
 - ������ Ÿ���̳� ũ�⸸ ����
�ش� �÷��� �����Ͱ� ���� ���
 - �÷��� ������ Ÿ���� ���� �Ұ�
 - ũ�⸦ �ø��� ������ ���� ������ �ִ� ������ ũ�⺸�� �۰Դ� ���� �Ұ�
 
 alter table ���̺��
 modify (�÷��� ������Ÿ��);
*/

alter table emp01
add (job varchar(9));
desc emp01;

select job, ename from emp01;
desc emp01;
select * from emp01;
--��� �÷� ����
alter table emp01
modify(job varchar2(30));

--��� �÷� ����
alter table emp01
 drop column job;

/*
���̺� ����
drop table ���̺� ��
*/
select * from tab;

--��� �����뿡 ������� �ʰ� �ٷ� ����
drop table emp01 PURGE;
--��� �����뿡 �ִ� ���̺� �����ؼ� �����
PURGE table emp01;
--��� ������ ��ü ����
PURGE RECYCLEBIN;
--��� �����뿡 �ִ� ���̺� ����
FLASHBACK table emp01 to BEFORE DROP;

desc dept;

DROP TABLE DEPT purge;
select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME from USER_CONSTRAINT where TABLE_NAME='EMP';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPT';

rename emp02 to emp03;

select * from emp03;
CREATE table emp04 as SELECT * from emp03;
TRUNCATE table emp04;
DELETE from emp03;
ROLLBACK := emp03;

/*
���̺� ������ �߰�,����,���� (DML)
insert into, update set, delete from
select

insert(�߰�)
Ư���� �÷��� ������ �߰�
insert into ���̺��(�÷�1,�÷�2...),values(��1,��2,...);
��� �÷��� ������ �߰�
insert into ���̺�� values(��1,��2,...);
*/

CREATE table dept01(
deptno number (2),
dname varchar2 (14),
loc VARCHAR2 (13)
);

select * from dept;
select * from dept01;
insert into dept01(deptno,dname,loc) values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(NULL, 'RESEARCH', ' ');
insert into dept01 values(20, 'RESEARCH', 'DALLES');
insert into dept01(deptno,dname) values(10, 'ACCOUNTING');
DESC DEPT01;
DESC DEPT;

/*
���̺��� ������ ����
UPDATE ���̺��
SET �÷���1=��1,�÷���2 =��2
where = ����

update���� ������ ���� �����ϴ� ��
� �����͸� �����ϴ��� where���� �̿��Ͽ� ������ ������
where ���� �����ÿ��� ������� ������
*/
select * from emp;
select * from emp01;

drop table emp01;

CREATE table emp01 as select * from emp;

update emp01 set deptno=30;
rollback;

-- ��� ����� �޿��� 10% �λ��Ͻÿ�.
-- 1.1
update emp01 set sal=sal*1.1;
select * from emp01;
update emp01 set hiredate=sysdate;
update emp01 set deptno=30 where deptno=10;

-- �޿��� 3000 �̻��� ����� �޿��� 10% �λ�
update emp01 set sal=sal*1.1 where sal >=3000;

-- 87�⵵�� �Ի��� ����� �Ի����� ���÷� ���
update emp01 set hiredate=sysdate where substr(hiredate,1,2)='87'; 

rollback;

select * from emp01;

-- ����� �̸��� scott�� �μ���ȣ 10������ ���� ������ manager�� �����Ͻÿ�.

update emp01 set deptno=10,job='MANAGER' where ename='SCOTT';

-- ����� �̸��� scott�� �Ի����� ���÷�,�޿� 50,Ŀ�̼� 4000���κ����Ͻÿ�.

update emp01 set hiredate=sysdate , sal= 50,comm=4000 where enmae='SCOTT';

-- ���̺� ���ʿ��� ���� �����ϱ� ���� delete
-- delete from ���̺�� where ����;
drop table dept01;
-- create table dept01 as
select * from dept01;
delete from dept01;
rollback;
delete from dept01 where deptno=30;

/*
���� ���� ���� �Ͽ� Employee ���̺��� �����Ͻÿ�.

�����ȣ ����(4)�ڸ�,
����̸� ����(10)�ڸ�
����    ����(9)�ڸ�
���    ����(4),
�Ի���   ��¥��
�޿�    ����(7,2)
Ŀ�̼�   ����(7,2)
�μ���ȣ  ����(2)

������ �߰�
7369  smith  cleak    7836   80/12/17   800      20
7499  allen  salesman 7369   87/12/20   1600 300 30
7839  king   president                  5000
*/

create table Employee(
empno number(4),
ename varchar(10),
job varchar(9),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
drptno number(2) );
select * from Employee;
insert into employee values(7369, 'smith','clerk',7836,'80/12/17',800,null,20);
insert into employee values(7499, 'allen','salesman',7369,'87/12/20',1600,300,30);
insert into employee (empno, ename, job, sal) values (7839,'king','president',5000);
select * from Employee;

show user;

create user orauser01 identified by user01;