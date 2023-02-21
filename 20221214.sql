/* 
 LIKE ������
 - �˻��ϰ��� �ϴ� ���� �� ��� ���ϵ� ī��� �Բ� ����Ͽ� ���ϴ� 
   ������ �˻��ϴ� ������

   �÷��̸� LIKE ����
   ���ϵ� ī�� ����
   % : ���ڰ� ���ų�, �ϳ� �̻��� ���ڰ� � ���� ���� ������� ���
   0 ~ n���� ���ڿ��� ��ü�Ѵ�
   
   _ : �ϳ��� ���ڰ� � ���� ������ ����������
       �� �ѱ����� ���ڿ��� ��ü��
*/
-- %�� �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ���, %�� ��� ���ڰ� ���� ����̾���.
-- k�� �����ϴ� ����� �˻��Ͻÿ�.

-- K�� �����ϴ� ��� �˻�
SELECT empno, ename from emp where ename like 'K%'; 
-- K�� �����ϴ� ��� �˻�
SELECT empno, ename from emp where ename like '%K%';
-- K�� ������ ��� �˻�
SELECT empno, ename from emp where ename like '%K'; 
SELECT empno, ename from emp;

-- ����� ���� Ȯ��
show user;

-- _ : �� ���ڸ� ����ؼ� ����ϴ� ��
-- ��] �̸��� �ι�° ���ڰ� A�� ����� �˻��Ͻÿ�.
SELECT empno, ename from emp where ename like '_A%';
-- ����° R�� ���Ե� ��� �˻�
SELECT empno, ename from emp where ename like '__R%';
-- A�� ���Ե��� �ʴ� ��� �˻�
SELECT empno, ename from emp where ename not like '%A%';

SELECT * from emp;

-- NULL���� ���Ե� ������
SELECT ename, comm, job from emp where  comm is null;
/*
NULL ������
  ����Ŭ������ �÷��� NULL���� ����Ǵ� ���� ����Ѵ�
  NULL�� ��Ȯ��,�˼����� ���� �ǹ��ϸ�,0�� ������� �ƴ� ����� ����������,
              �˾� �������� ���� �ǹ��Ѵ�.
  NULL �� ����,�Ҵ�,�񱳰� �Ұ����ϴ�.
null �� ����Ǿ� �ִ� ��쿡�� �񱳿�����(=)�δ� �Ǵ��Ҽ� ����.

 is nill �� is null
 
 is null : ���� null�̸� ����
 is not null : ���� null�� �ƴϸ� ����
*/
-- NULL���� ���Ե��� �ʴ� ������
SELECT ename, comm, job from emp where  comm is not null;

-- ��] �ڽ��� ���� ����� ���� ����� �̸��� ���� �׸��� ���ӻ���� ����� ����Ͻÿ�.
SELECT ename,mgr,job from emp where mgr is null ;
-- ��] �ڽ��� ���� ����� ���� ����� �̸��� CEO�ιٲٰ� ���� �׸��� ���ӻ���� ����� ����Ͻÿ�.
SELECT ename,mgr,job "CEO" from emp where mgr is null ;

/*
  ������ ���� ORDER BY ��
  ORDER BY ���� �ο�(��)�� �����ϴµ� ����ϸ� ������ �� �ڿ� ����Ѵ�.
  ������ ������ �Ǵ� �÷� �̸� �Ǵ� SESELECT������ ��õ� ��Ī�� ����Ҽ� �ִ�.
  
                ��������(ASC)          ��������(DESC)
  ����              ���� ������          ū������
  ����              ���� ������         ���� �ݴ� ����
  ��¥             ���� ��¥ �������    ���� ��¥ �������
  NULL            ���� �������� ����    ���� ���� ����
  
***** �������� ��� �ҹ��ڸ� ���� ū������ �ϰ�, NULL���� ��� �� �� ���� ���� �������ν��Ѵ�.
*/

-- ����� �������� ��������  ���� �Ͻÿ�.
SELECT empno,ename from emp ORDER BY EMPNO DESC;
-- ����� �������� ��������  ���� �Ͻÿ�.
SELECT empno,ename from emp ORDER BY EMPNO ASC;

-- ����� ���,�̸�,�޿��� �޿��� ���� ������ ����Ͻÿ�.
SELECT empno,ename, sal from emp ORDER BY SAL DESC;
-- �Ի����� ���� �ֱ��� ��� ������ ����ϵ�, ���,�̸�, �Ի����� ����Ͻÿ�.
SELECT EMPNO, ENAME,HIREDATE FROM EMP ORDER BY HIREDATE DESC;

-- �޿��� ���� ����� ������ ��� �̸��� ö���� ������ ���� ����� �������� ����Ͻÿ�.
SELECT empno,ename, sal from emp ORDER BY sal desc, ename asc;

/*
dual ���̺� 
 ����Ŭ���� 1���� �� ������ ȯ���ϰ����Ѵ�.
 1���� 24�ð��̰� 1�ð��� 60���̸� 1���� 60���̹Ƿ� 24*60*60 �ϸ�
 �Ϸ簡 �������� ����, �̷� ����� �������� 
 ���� ������� ����Ŭ ������Ʈ�� �ٷ� �Է��ϸ� ������ �߻��Ѵ�.
 �ֳ��ϸ� 24*60*60�� sql���� ������ ������ ���� ����̱� �����̴�.
 
 dual ���̺��� ��������̳� �����÷�(null) ���� ���� �ѹ��� ����ϰ� ������ ����ϴ�
 ���� ������ ���̺�ν� DUMMY��� �Ѱ��� �÷����� ������ ���̺��̴�.
 DUMMY�÷����� �Ѱ��� ���ڸ� ������ �� �ְ� �� �ϳ��� �ุ �����Ѵ�.
*/
SELECT 20*2 from dual;
desc dual;
SELECT 24*60*60 from dual ;
select * from dual;

select deptno, sal from emp where deptno=30;

SELECT deptno, sum(sal) from emp group by deptno having deptno=30;

/*
������ �Լ� : �ึ�� �Լ��� ����Ǿ� ����� ��ȯ�Ѵ�
 - ���� �Լ� : ���ڿ��� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ���� �ǹ��Ѵ�.
 - ���� �Լ� : ���� ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ���� �ǹ��Ѵ�.
 - ��¥ �Լ� : ��¥ ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ���� �ǹ��Ѵ�.
 - ��ȯ �Լ� : ����,��¥,����,���� ���� �ٸ� Ÿ������ ��ȯ�Ͽ� ��Ÿ���� �ǹ��Ѵ�.
 - �Ϲ� �Լ� : ��Ÿ�Լ�

�׷��ռ� : �ϳ� �̻��� ���� �׷����� ���� �����Ͽ� ����� ��ȯ�Ѵ�.
- SUM : �׷��� ������ �հ踦 ��ȯ��
- AVG : �׷��� ����� ��ȯ��
- COUNT : �׷��� �� ������ ��ȯ�Ѵ�
- MAX  : �׷��� �ִ밪�� ��ȯ�Ѵ�
- MIN  : �׷��� �ּҰ��� ��ȯ�Ѵ�
- STDDEV : �׷��� ǥ�������� ��ȯ�Ѵ�
- VARIANCE : �׷��� �л��� ��ȯ�Ѵ�
*/

/*
 - �����Լ� : ���ڿ��� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ���� �ǹ��Ѵ�.
            �������� ���� �����Ͽ� ��ȯ�� ���� ���� ��ȯ�Ѵ�
 *LOWER : �ҹ��ڷ� ��ȯ
 *UPPER : �빮�ڷ� ��ȯ
 INITCAP : ù���ڸ� �빮�ڷ� ��ȯ �������� �ҹ��ڷ�
 CONCAT  : ������ ���� ������ �ǹ��Ѵ�
 SUBSTR  : ���ڸ� �߶� ������ (�ѱ� 1bye) 
 SUBSTRB : ���ڸ� �߶� ������(�ѱ� 2byte)
 LENGTH  : ������ ���̸� ��ȯ (1byte)
 LENGTHB : ������ ���̸� ��ȯ (2byte)
 INSTR   : Ư�� ������ ��ġ ���� ��ȯ (�ѱ� 1byte)
 INSTRB  : Ư�� ������ ��ġ ���� ��ȯ (�ѱ� 2byte)
 LPAD,RPAD : �Է¹��� ���ڿ��� ��ȣ�� �����Ͽ� ���� ������ ���ڿ��� ��ȯ
 TRIM      : ���� �߶󳻰� ���� ���ڸ� ǥ��
 CONVERT   : char set ��ȯ
 CHR       : ASCII �ڵ� ������ ��ȯ
 ASCII     : ASCII �ڵ� ���� ���ڷ� ��ȯ
 REPLACE   : ���ڿ����� Ư�� ���ڸ� �����Ѵ�. 
*/
select concat('Data','Base') from dual;

select RPAD ('DataBase', 20, ' ') from dual;
select LPAD (ename, 20, '#') from emp;
select trim (' 'from'    (Data)   ') from dual;

select empno,ename from emp;
select empno,initcap(ename) from emp; 

select substr ('DataBase',1,3) from dual;
select substr (hiredate,5,6) from emp;

select initcap (ename) from emp where length (ename)=5;

select substr('DataBase', -4,4)from dual;

select substrB('�����ͺ��̽�', 3,3)from dual; -- ���ڼ� ����
select substr('�����ͺ��̽�', -3,3)from dual; -- ����Ʈ�� ����