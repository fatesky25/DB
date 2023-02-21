/*
숫자함수 : 숫자 값을 다른 형태로 변환하여 나타낸다.
         숫자 데이터를 조작하여 변환된 숫자 값을 변환하는 함수
         
         
구분         설명
=========================================================
ABS         절대값을 반환    
COS         cosine 값을 반환
EXP         e 의 n 승을 반환 
(*)FLOOR    소수점 아래를 잘라버림
LOG         log값을 반환
POWER       power(m,n)형식으로 m의 n승을 반환함
SING        sing(n) n < 0 이면 -1, n=0, n > 0 이면 1을 반환
SIN         sine값을 반환
TAN         tangent값 반환
(*)ROUND    특정 자릿수에서 반올림
(*)TRUNC    특정 자릿수에서 잘라냄
(*)MOD      입력받은 수를 나눈 나머지 값을 반환
*/

select abs (-15) from dual;
select floor (34.5678) from dual;

select round(1234.5678) ,
round(1234.5678,0), -- 소숫점 첫째 자리에서 반올림 한다.
round(1234.5678,1),
round(1234.5678,2),
round(1234.5678,-1),
round(1234.5678,-2)
from dual;

select mod (34, 2) from dual;
select mod (34, 7) from dual;

/* 날짜함수 
날짜 함수 : 날짜 값을 다른 형태로 변환하여 나타냄을 의미한다.
        Data(날짜)형에 사용하는 함수이묘 결과값으로 또는 기간을 얻는다.
        기간은 주로 일 단위로 계산되지만 월 단위로 계산되는 경우도 있다.
        
   SYSDATE    - 시스템에 저장된 현재 날짜를 반환
   MONTHS_BETWEEN  - 두 날짜 사이가 몇 개월인지를 반환
   ADD_MONTHS  - 특정한 날짜에 개월수를 더할경우
   NEXT_DAY   - 특정한 날짜에서 최초로 도래하는 인자로 받은 요일의 날짜를 반환 
   LAST_DAY   - 해당 월의 마지막 날짜를 반환
   ROUND      - 인자로 받은 날짜를 기준으로 반올림한다.
   TRUNC      - 인자로 받은 날짜를 기준으로 나머지를버림
*/   
        
select SYSDATE FROM DUAL;
SELECT SYSDATE-1 어제, SYSDATE 오늘 ,SYSDATE +1 내일 FROM DUAL;
select LAST_DAY(SYSDATE) FROM DUAL;
SELECT SUBSTR (SYSDATE, -2,2)FROM DUAL;

/*
문] 부서번호가 10인 사원을 대상으로 입사한 날로 부터 오늘이 며칠이 지났는지 근무 일수를 구하시오.
*/

select hiredate,round(sysdate - hiredate) 근무일수 from emp where deptno=10;

select sysdate,hiredate,round(MONTHS_BETWEEN(sysdate, hiredate))  from emp where deptno=10;

select sysdate,hiredate,round(add_months(hiredate,3)) 증가개월 from emp where deptno=10;

-- next_day : 해당 요일의 가장 가까운 날짜를 반환하는 함수
-- 형식 : next_day(date,요일)
ALTER SESSION SET NLS_LANGUAGE=JAPANESE;
ALTER SESSION SET NLS_LANGUAGE=KOREAN;
ALTER SESSION SET NLS_LANGUAGE=AMERICAN;
ALTER SESSION SET NLS_LANGUAGE=GERMAN;
ALTER SESSION SET NLS_LANGUAGE=SPAIN;
select sysdate, next_day(sysdate, '수요일') from dual;
select sysdate, next_day(sysdate, '水曜日') from dual; 
-- 1.일요일 2.월요일 3.화요일 4.수요일 5.목요일 6.금요일 7.토요일

/*
변환함수 : 문자,날짜,숫자 값을 서로 다른 타입으로 변환하여 나타냄
         자료형을 변환시키고자 할때 사용하는 함수

TO_CHAR   - 날짜형 혹은 숫자형을 문자형으로 변환
TO_DATE   - 문자형을 날짜형으로 변환
TO_NUMBER - 문자형을 숫자형으로 변환

TO_CHAR   - (날짜 데이터,'출력형식')

YYYY   - 년도 4자리
YY     - 년도 2자리
MM     - 월을 숫자로 표시
MON    - 월을 알파벳으로
DD     - 일 표시
DAY    - 요일 표시
DY     - 요일을 약어로 표시
*/

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY,HH24:MI:SS') 요일 FROM DUAL;

SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE=TO_DATE(19810220);
SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE=TO_DATE(19810220, 'YYYYMMDD');

SELECT SYSDATE-TO_DATE('2022/01/01','YYYY/MM/DD') FROM DUAL;
SELECT TRUNC(SYSDATE-TO_DATE('2022/01/01','YYYY/MM/DD')) FROM DUAL;

/*
TO_NUMBER 문자형을 숫자형으로 변환
         - 숫자형으로 변환하는 함수
*/

SELECT TO_NUMBER ('10,000','999,999')+TO_NUMBER ('20,000','999,999') FROM DUAL;

/*
일반 함수
NVL - 첫번째 인자로 받은 값이 NULL과 같으면 두번째 인자 값으로 변경
DECODE - 첫번째 인자로 받은 값을 조건에 맞춰서 변경(IF 와 유사)
CASE - 조건에 맞는 문장을 수행하라 (SWITCH 와 유사)
*/

-- NVL : NULL을 다른 값으로 변환하는 함수
--       NULL을 0 또는 다른 값으로 변환하기 위한 함수

SELECT ENAME,SAL,COMM,JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,NVL(COMM,0), JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,COMM,SAL * 12, SAL * 12 * COMM ,JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,COMM,SAL * 12 +COMM,JOB FROM EMP ORDER BY JOB;
SELECT ENAME,SAL,COMM,SAL * 12 + NVL (COMM,0),JOB FROM EMP ORDER BY JOB;

/*
DECODE : 첫번째 인자로 받은 값을 조건에 맞춰서 변경 (IF와 유사)
     DECODE (표현식, 조건1,조건1,
                    조건2,조건2,
                    조건3,조건3,
                    기본결과 N)
*/
SELECT * FROM DEPT;
SELECT DEPTNO FROM EMP;
SELECT DEPTNO, DECODE (DEPTNO, 10,'ACCOUNTING',
                               20,'RESEARCH',
                               30, 'SALES',
                               40, 'OPERATIONS')AS "부서명"
FROM EMP;

/*
CASE 함수
조건에 따라 서로 다른 처리가 가능하다.
   CASE 표현식 WHEN 조건1 THEN 결과 1
              WHEN 조건2 THEN 결과 2
              WHEN 조건3 THEN 결과 3
   ELSE 결과 N
   END
*/

SELECT DEPTNO,
                     CASE WHEN DEPTNO= 10 THEN 'ACCOUNTING'
                          WHEN DEPTNO= 20 THEN 'RESEARCH'
                          ELSE 'REST'
                          END 
                          AS "부서명"
FROM EMP;
/*
문] 
    직급에 따라 급여를 인상하도록 하자.(사원번호,사원명,직급,급여)
    직급이  'ANALYST'  인 사원은 5%,
           'SALSEMAN' 인 사원은 10%,
           'MANAGER'  인 사원은 15%,
           'CLERK'    인 사원은 20% 인상된다.
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

-- 부서별로 사원의 수와 커미션을 받는 사원의 수를 카운트 하시오.

SELECT DEPTNO,COUNT (*),COUNT(COMM) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO,TRUNC(AVG(SAL))FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) >= 2000;
SELECT DEPTNO,MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) > 2900;
SELECT DEPTNO,TRUNC(AVG(SAL)), MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) > 2900;

/*
DDL - 데이터 정의어 (Data Define Language)
CREATE : 생성 ,ALTER : 변경 ,DROP : 삭제 ,TRUNCATE : 초기화

DML - (Data Define Language) 
INSERT=추가, DELETE=삭제, UPDATE=변경 , SELECT =조회

DCL - Data Control Language
COMMIT=완료처리보고, ROLLBACK=원래상태복구, GRANT=권한부여, REVOKE=박탈,회수
*/