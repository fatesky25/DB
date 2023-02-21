SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM user_constraints WHERE TABLE_NAME='DEPT01';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM user_constraints WHERE TABLE_NAME='EMP01';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM user_constraints WHERE TABLE_NAME IN ('DEPT01','EMP01');

SELECT * from EMP01;
SELECT * from DEPT01;

-- DEPT01 테이블의 기본키를 비활성화 한다.

ALTER TABLE DEPT01
DISABLE PRIMARY KEY;
-- DEPT01 테이블의 기본키는 EMP01테이블의 외래키에서 참조하고 있기 때문에
-- 제약조건을 비활성화 할 수 없다.
ALTER TABLE EMP01
DISABLE PRIMARY KEY;

-- 부모테이블과 자식테이블을 동시에 비활성화
ALTER TABLE DEPT01
DISABLE PRIMARY KEY CASCADE;
ROLLBACK;

-- 부모테이블과 자식테이블을 동시에 비활성화
ALTER TABLE EMP01
DISABLE PRIMARY KEY;

ALTER TABLE DEPT01
DROP PRIMARY KEY CASCADE;
ROLLBACK;

/*
 조인
 - 한 개 이상의 테이블에서 원하는 결과를 얻기 위한 방법
 
   Equi Join       : 동일한 컬럼을 기준으로 조인한다.
   Non Equi Join   : 동일한 컬럼이 없이 다른 조건을 사용하여 조인
   Outer Join      : 조인 조건에 만족하지 않는 행도 나타난다.
   Self Join       : 한 테이블 내에서 조인한다.
   emp a, emp b
*/

SELECT ENAME , DNAME FROM EMP01,DEPT01 WHERE emp01.deptno=dept01.deptno;

-- Non Equi Join은 조인할 테이블 사이에 컬럼의 값이 직접적으로 일치하지 않을 시
-- 사용하는 조인으로 '='을 제외한 연산자를 사용한다.

SELECT * from salgrade;
SELECT * from emp01;

SELECT E.ENAME, E.SAL, S.GRADE FROM EMP E, salgrade S --별칭정할때는 FROM뒤에서 해준다
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- Outer Join  : 행이 조인 조건에 만족하지 않을 경우 그 행은 결과에 
--               나타나지 않게 된다 이때 조인 조건에 만족하지 않는 
--               행들도 나타나게함

SELECT * from dept01;

SELECT e.ename, d.deptno, d.dname
FROM EMP E, DEPT D
where e.deptno(+)=d.deptno;

-- 특정 사원을 담당하는 매니저 사원의 이름을 출력
SELECT ename, mgr from emp;

SELECT work.ename"사원", manager.ename "매니저"
from emp work, emp manager
WHERE work.mgr=manager.empno;

/*
서브쿼리
 서브쿼리는 하나의 select 문장의 절 안에 포함된 또하나의 select문을 의미한다.
 메인(주), 서브(부)
*/

-- scott의 부서명을 알아보려고한다.
SELECT deptno from emp where ename='SCOTT';

-- 부서번호가 20번이면 부서이름을 알아 낼수 있다.
SELECT dname from dept;

SELECT dname FROM dept where deptno=20;

SELECT dname from dept where deptno=(-- 메인 쿼리
SELECT deptno from emp where ename='SCOTT'); -- 서브 쿼리

/*
단일행 서브쿼리 : 내부 select문장으로부터 오직 하나의 행만을 반환한다
               사용 연산자 : 비교연산자 사용(>(작다),<(크다),<==(크거나같다),>=(작거나같다),=(같다),!=(같지않다)<>)
다중행 서브쿼리 : 서브쿼리에서 반환하는 결과가 하나 이상의 행일때를 의미함
               사용 연산자 : IN(||), (ANY, SOME(여러개의 값중 하나만 맞아도 참)), ALL(&&) , EXIST()
*/

/*
IN 연산자

급여를 3000이상 받는 사원이 소속된 부서와 동일한부서에서 근무하는 사원을 출력하시오.
*/

SELECT DISTINCT(deptno) deptno from emp where sal > = 3000;
SELECT ename, sal, deptno from emp;
-- 서브 쿼리
SELECT ename, sal, deptno from emp where deptno in(SELECT DISTINCT(deptno) deptno from emp where sal > = 3000);

/*
ALL 연산자 : 메인 쿼리의 비교 조건이 서브쿼리의 검색결과와 모든 값이 일치하면 참

 0번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 출력하시오.
*/
SELECT ename,sal from emp where sal > 2850; -- 메인
SELECT max (sal) from emp where deptno=30;  -- 서브

SELECT ename,sal from emp where sal > all(SELECT max (sal) from emp where deptno=30);

/*
 ANY 연산자는 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상만 일치하면 참
 즉, 찾아진 값에서 가장 작은값(최소값)보다 크면 참이된다.

-- 부서번호가 30번인 사원들의 급여 중 가장 작은값 보다 많은 급여를 받는 사원의 이름과 급여를 출력하시오.
*/

SELECT min(sal) from emp WHERE deptno=30; -- 서브쿼리
SELECT ename,sal from emp;
SELECT ename,sal from emp where sal > any(SELECT min(sal) from emp WHERE deptno=30);

CREATE table emp08 as SELECT * from emp;
drop table emp08;
desc emp;
SELECT * from emp08;
SELECT * from tab;
PURGE RECYCLEBIN;

-- 테이블의 구조만 복사
-- 1=0 : 항상 거짓이다
CREATE table emp08 as SELECT * from emp where 1=0;

CREATE table dept02 as SELECT * from dept where 1=0;
drop table dept02;
SELECT * from dept02;
SELECT * from dept;
-- 추가한다  deppt02에   dept모든데이터를
INSERT into dept02 SELECT * from dept;

SELECT * from dept02;

/*
10번 부서의 지역명을 40번 부서의 지역명으로 변경하시오.
new york --> boston
*/

UPDATE dept02 set loc=(SELECT loc from dept02 where deptno=40)where deptno=10;
ROLLBACK;

/*
20번 부서명과 지역명을 30번 부서의 부서명과 지역명으로 변경하시오.
*/

UPDATE dept02 set (dname,loc)= (SELECT dname,loc from dept02 where deptno=30)where deptno=20;

CREATE table emp09 as SELECT *from emp;

SELECT * from emp09;
SELECT deptno, dname from dept01;

-- 부서 번호 검색 : 30
SELECT deptno from dept01 where dname='SALES';

DELETE from emp09 where deptno=(SELECT deptno from dept01 where dname='SALES');

SELECT * from dept01;
delete from dept01 where deptno=20;
commit;
rollback;

-- commit 후에는 rollback을 해도 소용이 없다.

/*
시퀀스
 시퀀스는 유일한 값 생성해 주는 오라클 객체
 시퀀스를 생성하면 기본키와 같이 순차적으로 증가하는 컬럼을 자동적으로 생성할수있다.
 
 형식
 
 CREATE SEQUENCE 시퀀스 이름
 START WITH N
 INCREMENT BY N
 MAXVALUE N / NOMAXVALUE
 MINVALUE N / NOMINVALUE
 CYCLE /  NOCYCLE
 CACHE / NOCACHE;
 
 
 1. START WITH N 
    - 시퀀스의 시작값을 지정함
    N 을 1로 지정하면 1부터 순차적으로 증가
 1-1. INCREMENT BY N
    - 시퀀스의 증가값을 지정함
    1로 하면 1씩 증가하고 2로 하면 2씩 증가한다
 3. MAXVALUE N / NOMAXVALUE
    - 최대값지정 / 무한대로 지정
 4. MINVALUE N / NOMINVALUE
    - 최소값지정 / 무한소로 지정
 5. CYCLE /  NOCYCLE
    - 최대값까지 증가하면 다시 최소값으로 시작하도록 지정
      기본값은 NOCYCLE
 6. CACHE / NOCACHE;
    - 오라클에서 미리 지정해 높은 메모리 값
      기본값은 2
*/

-- 시작값이 1이고 1씩 증가하고 최대값이 1000000이 되는 시퀀스 EMP_SEQ를 생성하시오.

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000000;
-- 시퀀스 생성

select * from emp;
drop sequence emp_seq;

drop table emp10;

create table emp10
as select empno, ename, hiredate from emp where 1=0;
-- 비어 있는 테이블 생성

insert into emp10 values(1, 'JULIA',sysdate);

insert into emp10 values(emp_seq.NEXTVAL,'JULIA',sysdate);
-- 데이터 추가

select * from emp10;

-- insert into emp10 values(emp_seq.currval, 'JULIA',sysdate);
-- insert into emp10 values(emp_seq.nextval, 'JULIA',sysdate);

select * from emp10;
select emp_seq.CURRVAL from dual;
-- 현재 값을 반환함 : CURRVAL

select emp_seq.NEXTVAL from dual;
-- 현재 시퀀스의 다음값을 반환함 : NEXTVAL

delete from emp10;

-- 시퀀스를 확인 하는 명령
SELECT SEQUENCE_NAME, MIN_VALUE,MAX_VALUE, INCREMENT_BY,


