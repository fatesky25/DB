/*
select
 - ������ ���̽��κ��� ������ �˻��Ҽ��ִ� ��ɾ��̴�.
 - ������ �ο��ؼ� Ư���� �ο�(��)�� ��ȸ�Ѵ�.
 - Ư�� �÷�(��)�� �������� �������� �Ǵ� ������������ �����Ѵ�.
 
 ���� 
 - select 
    * : ��� �÷��� �ǹ���
 �÷���,�÷���,... from ���̺� ��
*/

SELECT 
deptno, 
loc from dept 
WHERE deptno=10 or deptno =20;

select * from tab;
-- emp ���̺��� ��� ������ ����Ͻÿ�.
SELECT * from emp;
SELECT * FROM dept;

desc dept;

--dept ���̺��� �μ���ȣ�� �μ��� ����Ͻÿ�.
-- �÷� �̸��� ����ؼ� Ư�� �÷��� ��ȸ�ϱ�
SELECT deptno, dname FROM dept;

-- ��� ���̺��� �̸���, �޿���, �Ի����� ����Ͻÿ�.
SELECT * FROM emp;
SELECT ename, sal, hiredate from emp;

-- �÷� �̸��� ��Ī �����ϱ�
SELECT deptno as "DepartmentNo" from dept;
SELECT deptno from dept;
/*
 �÷��� ����� �ٷ� �ڿ� as ��� Ű���带 ���� ��Ī�� ����Ѵ�.
 ��Ī�� ���鹮�ڳ� $,_,#�� Ư�����ڸ� ǥ���ϰ� �Ͱų� ��ҹ��ڸ� �����ϰ� ������
 " "�� ����ϸ� �ȴ�.
 as �� �����ϰ� ""��  ����Ͽ� ��Ī ��� ����
*/
SELECT deptno as "fatesky" from dept;
SELECT deptno as �μ���ȣ from dept;
SELECT deptno "�ѹ�", dname �ڹ�Ŭ from dept;

SELECT * FROM emp;
SELECT DISTINCT job from emp;
SELECT DISTINCT deptno from emp;

/* =,(����) >,(ũ��) <,(�۴�) >=,(ũ�ų�����) <=,(�۰ų�����) (!=, ^=, <>) (�ٸ���)*/

-- �޿��� 3õ�̻� �޴� ����� ����ϵ�, �����ȣ,����̸�, �޿�������Ͻÿ�
SELECT empno, ename, sal from emp WHERE sal >= 3000;

-- �޿��� 3õ�̸� �޴� ����� ����ϵ�, �����ȣ,����̸�, �޿�������Ͻÿ�
SELECT empno, ename, sal from emp WHERE sal < 3000;

SELECT * from emp where deptno =10;

-- �޿��� 3õ�̸� �޴� ����� ����ϵ�, �����ȣ,����̸�, �޿�������Ͻÿ�
SELECT empno, ename, sal from emp WHERE sal < 2000;

/*
���� ������ ��ȸ
 - ���ڵ����ʹ� �ݵ�� ���ϵ���ǥ(�̱�����)�ȿ� ǥ���Ѵ�.
 - ��ҹ��ڸ� �����Ѵ�.
*/
SELECT empno, ename, sal from emp WHERE ename='SCOTT';

-- �̸��� MILLER�� ����� �����ȣ�� ����̸��� ������ ����Ͻÿ�.

SELECT empno, ename, job from emp WHERE ename='MILLER';

/*
 ��¥ ������ ��ȸ
 - �ݵ�� ���� ����ǥ �ȿ� ǥ����
   ���� : ��/��/�� 
   1985�� ���Ŀ� �Ի��� ������� �̸��� �Ի��� ����Ͻÿ�.
*/
SELECT ename, hiredate from emp where hiredate >= '1985/01/01'; 


/*
AND ������
 - ��� ���� ������ �����ؾ��� ��� ����ϴ� ������
 
 ��] �μ���ȣ�� 10���̰� ������ MANAGER�� ����� �̸�,�μ���ȣ,������ ����Ͻÿ�.
*/

SELECT ename, deptno, job from emp where deptno=10 and job= 'MANAGER';

--�޿��� 1000���� 3000 ������ �ִ� ����� ��� ������ ����Ͻÿ�.

SELECT * from emp;
SELECT * from emp WHERE sal >= 1000 and sal <=3000;

/*
 or ������
 - �ΰ��� ������ �ϳ��� �����ϴ��� �˻��� ����
 
 ��1] �μ���ȣ�� 10���̰ų� ������ MANAGER�� ����� �̸�,�μ���ȣ,������ ����Ͻÿ�
*/

SELECT ename, deptno, job from emp where deptno=10 or job= 'MANAGER';

-- �����ȣ�� 7844�̰ų� 7654�̰ų� 7521�� ����� ��������� ����Ͻÿ�.
SELECT * from emp where empno= 7844 or empno=7654 or empno=7521;

-- not : �ݴ�Ǵ� ����
SELECT * from emp where not deptno=10;

-- ������ MANAGER�� �ƴѻ���� ��� ���
SELECT * from emp where not job='MANAGER';


/*
 BETWEEN AND ������
 - Ư�� ���� ���� ���ϴ� �����͸� �˻��Ҷ� ����ϴ� ������
 ���� : �ķ��� BETWEEN A AND B
 
 -- ��1] �޿��� 1000���� 3000���̿� �ִ� ����� ������ ����Ͻÿ�.
*/
SELECT * from emp WHERE sal >= 1000 and sal <=3000;
SELECT * from emp where sal BETWEEN 1000 and 3000;

-- �޿��� 1500�� 2500 ������ ����� �����ȣ, ����̸�,�޿��� ����Ͻÿ�.
-- ��, AND �����ڿ� between and �����ڸ� ����Ͽ� ����Ͻÿ�.

SELECT empno, ename, sal from emp where sal >=1500 and sal <=2500;
SELECT empno, ename, sal from emp where sal BETWEEN 1500 and 2500;

-- in ������
-- ������ �÷��� �������� ���� �ϳ������� �˾ƺ����� �Ҷ� ����ϴ� ������
   SELECT * from emp where empno in(7844,7654,7521);

-- Ŀ�̼��� 300�̰ų� 500�̰ų�, 1400 �� �ϳ��� ����� �̸�,�޿�,Ŀ�̼��� ����Ͻÿ�.
SELECT ename, sal, comm from emp where comm=300 or comm=500 or comm=1400;
SELECT ename, sal, comm from emp where comm in (300,500,1400);

SELECT  ename,job,hiredate from emp where ename='A';
