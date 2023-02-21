/*
�����Լ� : ���� ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ����.
         ���� �����͸� �����Ͽ� ��ȯ�� ���� ���� ��ȯ�ϴ� �Լ�
         
         
����         ����
=========================================================
ABS         ���밪�� ��ȯ    
COS         cosine ���� ��ȯ
EXP         e �� n ���� ��ȯ 
(*)FLOOR    �Ҽ��� �Ʒ��� �߶����
LOG         log���� ��ȯ
POWER       power(m,n)�������� m�� n���� ��ȯ��
SING        sing(n) n < 0 �̸� -1, n=0, n > 0 �̸� 1�� ��ȯ
SIN         sine���� ��ȯ
TAN         tangent�� ��ȯ
(*)ROUND    Ư�� �ڸ������� �ݿø�
(*)TRUNC    Ư�� �ڸ������� �߶�
(*)MOD      �Է¹��� ���� ���� ������ ���� ��ȯ
*/

select abs (-15) from dual;
select floor (34.5678) from dual;

select round(1234.5678) ,
round(1234.5678,0), -- �Ҽ��� ù° �ڸ����� �ݿø� �Ѵ�.
round(1234.5678,1),
round(1234.5678,2),
round(1234.5678,-1),
round(1234.5678,-2)
from dual;

select mod (34, 2) from dual;
select mod (34, 7) from dual;

/* ��¥�Լ� 
��¥ �Լ� : ��¥ ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ���� �ǹ��Ѵ�.
        Data(��¥)���� ����ϴ� �Լ��̹� ��������� �Ǵ� �Ⱓ�� ��´�.
        �Ⱓ�� �ַ� �� ������ �������� �� ������ ���Ǵ� ��쵵 �ִ�.
        
   SYSDATE    - �ý��ۿ� ����� ���� ��¥�� ��ȯ
   MONTHS_BETWEEN  - �� ��¥ ���̰� �� ���������� ��ȯ
   ADD_MONTHS  - Ư���� ��¥�� �������� ���Ұ��
   NEXT_DAY   - Ư���� ��¥���� ���ʷ� �����ϴ� ���ڷ� ���� ������ ��¥�� ��ȯ 
   LAST_DAY   - �ش� ���� ������ ��¥�� ��ȯ
   ROUND      - ���ڷ� ���� ��¥�� �������� �ݿø��Ѵ�.
   TRUNC      - ���ڷ� ���� ��¥�� �������� ������������
*/   
        
select SYSDATE FROM DUAL;
SELECT SYSDATE-1 ����, SYSDATE ���� ,SYSDATE +1 ���� FROM DUAL;
select LAST_DAY(SYSDATE) FROM DUAL;
SELECT SUBSTR (SYSDATE, -2,2)FROM DUAL;

/*
��] �μ���ȣ�� 10�� ����� ������� �Ի��� ���� ���� ������ ��ĥ�� �������� �ٹ� �ϼ��� ���Ͻÿ�.
*/

select hiredate,round(sysdate - hiredate) �ٹ��ϼ� from emp where deptno=10;

select sysdate,hiredate,round(MONTHS_BETWEEN(sysdate, hiredate))  from emp where deptno=10;

select sysdate,hiredate,round(add_months(hiredate,3)) �������� from emp where deptno=10;

-- next_day : �ش� ������ ���� ����� ��¥�� ��ȯ�ϴ� �Լ�
-- ���� : next_day(date,����)
ALTER SESSION SET NLS_LANGUAGE=JAPANESE;
ALTER SESSION SET NLS_LANGUAGE=KOREAN;
ALTER SESSION SET NLS_LANGUAGE=AMERICAN;
ALTER SESSION SET NLS_LANGUAGE=GERMAN;
ALTER SESSION SET NLS_LANGUAGE=SPAIN;
select sysdate, next_day(sysdate, '������') from dual;
select sysdate, next_day(sysdate, '�����') from dual; 
-- 1.�Ͽ��� 2.������ 3.ȭ���� 4.������ 5.����� 6.�ݿ��� 7.�����

/*
��ȯ�Լ� : ����,��¥,���� ���� ���� �ٸ� Ÿ������ ��ȯ�Ͽ� ��Ÿ��
         �ڷ����� ��ȯ��Ű���� �Ҷ� ����ϴ� �Լ�

TO_CHAR   - ��¥�� Ȥ�� �������� ���������� ��ȯ
TO_DATE   - �������� ��¥������ ��ȯ
TO_NUMBER - �������� ���������� ��ȯ

TO_CHAR   - (��¥ ������,'�������')

YYYY   - �⵵ 4�ڸ�
YY     - �⵵ 2�ڸ�
MM     - ���� ���ڷ� ǥ��
MON    - ���� ���ĺ�����
DD     - �� ǥ��
DAY    - ���� ǥ��
DY     - ������ ���� ǥ��
*/

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY,HH24:MI:SS') ���� FROM DUAL;

SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE=TO_DATE(19810220);
SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE=TO_DATE(19810220, 'YYYYMMDD');

SELECT SYSDATE-TO_DATE('2022/01/01','YYYY/MM/DD') FROM DUAL;
SELECT TRUNC(SYSDATE-TO_DATE('2022/01/01','YYYY/MM/DD')) FROM DUAL;

/*
TO_NUMBER �������� ���������� ��ȯ
         - ���������� ��ȯ�ϴ� �Լ�
*/

SELECT TO_NUMBER ('10,000','999,999')+TO_NUMBER ('20,000','999,999') FROM DUAL;

/*
�Ϲ� �Լ�
NVL - ù��° ���ڷ� ���� ���� NULL�� ������ �ι�° ���� ������ ����
DECODE - ù��° ���ڷ� ���� ���� ���ǿ� ���缭 ����(IF �� ����)
CASE - ���ǿ� �´� ������ �����϶� (SWITCH �� ����)
*/

-- NVL : NULL�� �ٸ� ������ ��ȯ�ϴ� �Լ�
--       NULL�� 0 �Ǵ� �ٸ� ������ ��ȯ�ϱ� ���� �Լ�

SELECT ENAME,SAL,COMM,JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,NVL(COMM,0), JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,COMM,SAL * 12, SAL * 12 * COMM ,JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,COMM,SAL * 12 +COMM,JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,COMM,SAL * 12 + NVL (COMM,0),JOB FROM EMP ORDER BY JOB;

/*
DECODE : ù��° ���ڷ� ���� ���� ���ǿ� ���缭 ���� (IF�� ����)
     DECODE (ǥ����, ����1,����1,
                    ����2,����2,
                    ����3,����3,
                    �⺻��� N)
*/
SELECT * FROM DEPT;
SELECT DEPTNO FROM EMP;
SELECT DEPTNO, DECODE (DEPTNO, 10,'ACCOUNTING',
                               20,'RESEARCH',
                               30, 'SALES',
                               40, 'OPERATIONS')AS "�μ���"
FROM EMP;

/*
CASE �Լ�
���ǿ� ���� ���� �ٸ� ó���� �����ϴ�.
   CASE ǥ���� WHEN ����1 THEN ��� 1
              WHEN ����2 THEN ��� 2
              WHEN ����3 THEN ��� 3
   ELSE ��� N
   END
*/

SELECT DEPTNO,
                     CASE WHEN DEPTNO= 10 THEN 'ACCOUNTING'
                          WHEN DEPTNO= 20 THEN 'RESEARCH'
                          ELSE 'REST'
                          END 
                          AS "�μ���"
FROM EMP;
/*
��] 
    ���޿� ���� �޿��� �λ��ϵ��� ����.(�����ȣ,�����,����,�޿�)
    ������  'ANALYST'  �� ����� 5%,
           'SALSEMAN' �� ����� 10%,
           'MANAGER'  �� ����� 15%,
           'CLERK'    �� ����� 20% �λ�ȴ�.
*/

SELECT * FROM EMP;
SELECT DEPTNO,ENAME,JOB,SAL,
                     CASE WHEN JOB='ANALYST' THEN SAL * 1.05
                          WHEN JOB='SALSEMAN' THEN SAL * 1.10
                          WHEN JOB='MANAGER' THEN SAL * 1.15  
                          WHEN JOB='CLERK' THEN SAL * 1.20 
                          ELSE SAL
                          END AS SALARY
FROM EMP;

SELECT TRUNC (AVG(SAL)) FROM EMP;
SELECT DISTINCT (DEPTNO) FROM EMP;
SELECT DEPTNO, SUM(SAL), TRUNC(AVG(SAL)) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO;

-- �μ����� ����� ���� Ŀ�̼��� �޴� ����� ���� ī��Ʈ �Ͻÿ�.

SELECT DEPTNO,COUNT (*),COUNT(COMM) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO,TRUNC(AVG(SAL))FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) >= 2000;
SELECT DEPTNO,MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) > 2900;
SELECT DEPTNO,TRUNC(AVG(SAL)), MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) > 2900;

/*
DDL - ������ ���Ǿ� (Data Define Language)
CREATE : ���� ,ALTER : ���� ,DROP : ���� ,TRUNCATE : �ʱ�ȭ

DML - (Data Define Language) 
INSERT=�߰�, DELETE=����, UPDATE=���� , SELECT =��ȸ

DCL - Data Control Language
COMMIT=�Ϸ�ó������, ROLLBACK=�������º���, GRANT=���Ѻο�, REVOKE=��Ż,ȸ��
*/