create sequence emp_seq
start with 1
increment by -10
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
SELECT SEQUENCE_NAME, MIN_VALUE,MAX_VALUE, INCREMENT_BY, CYCLE_FLAG FROM user_sequences;

SELECT emp_seq.nextval from dual;

/*
NEXTVAL, CURVAL 을 사용할수 있는 경우
1. 서브쿼리가 아닌 SELECT 문
3. INSERT 문의 SELECT 절
4. INTSERT VALUES절에 사용
5. UPDATE 문을 SET절

NEXTVAL, CURVAL 을 사용할수 없는 경우
1. VIEW의 SELECT절
3. DISTINCT 키워드가 있는 SELECT절
4. GROUP BY, HAVING, ORDER BY절이 있는 SELECT절
5. SELECT, DELETE, UPDATE의 서브쿼리
6. CREATE TABLE, ALTER TABLE 명령

시퀀스 값을 변경하려면 ALTER SEQUENCE

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
뷰의 개념
 - 보다란 의미를 갖고 있는 점을 점안해서 실제 테이블에 저장된 데이터를 뷰를 통해서 볼수있다.
 - 뷰를 가상 테이블이라고 함, 테이블과 거의 동일하게 사용되기 때문이다.
 
 뷰는 물리적인 구조인 테이블과 달리 저장공간이 없다.
 뷰는 단지 쿼리문을 저장하고 있는 객체라고 표현할 수 있다.
 
뷰의 사용목적
 - 직접적인 테이블 접근을 제한하기 위해 사용한다.
 - 복잡한 질의를 쉽게 만들기 위해서 사용된다.
 
뷰의 특징
 - 뷰는 테이블에 대한 제한을 가지고 테이블의 일정한 부분만 보일 수 있는 가상 테이블이다.
 - 뷰는 실제 데이터를 가지고 있지는 않지만,
 뷰를 통해서 테이블을 관리할 수 있다.
 하나의 테이블의 뷰의 개수는 제한이 없다.
 
 
 뷰는 CREATE문을 이용하여 생성한다.
 
 기본테이블
     뷰에 의해 제한적으로 접근해서 사용하는 실질적으로 
     데이터를 저장하고 있는 물리적인 테이블을 의미한다.
*/

SELECT * from emp01;
drop table emp01;
CREATE table emp01
as SELECT * from emp;

select empno, ename, sal, deptno FROM emp01 where deptno=10;

/*
뷰의 생성
뷰는 테이블 처럼 하나의 개체로서 테이블 생성할때와 유사하게 create view 명령으로 생성한다.

CREATE [OR REPLACE][FORCE | NOFOCE] VIWE VIWE_NAME
AS SUBQUERY
[WITH CHECK OPTION]
[WITH READ ONLY];  -- 해당 뷰를 통해서는 SELECE만 능하다.
INSERT/UPDATE,DELETE 명령어는 사용할수 없다.

 OR REPLACE
 - 새로운 뷰를 만들수 있을 뿐만 아니라 기존에 뷰가 존재하더라도 삭제하지않고 새로운
   구조의 뷰로 변경할 있다.
 FORCE | NOFOCE
 - 기본테이블의 존재여부에 상관없이 뷰를 생성한다.
 WITH CHECK OPTION
 - 해당 뷰를 통해서 볼 수 있는 범위 내에서만 UPDATE OR INSERRT 명령이 가능하다.
 WITH READ ONLY]

뷰의 동작 원리
 - 사용자가 뷰에 대해서 질의를 하면 user_view에서 뷰에대한 조회를 할수있다.
 - 기본 테이블에 대한 접근 권한을 살핀다.
 - 뷰에 대한 질의를 기본 테이블에대한 질의로 변환함
 - 기본 테이블에 대한 질의를 통해서 데이터를 검색함
 - 검색된 결과를 출력
 
 뷰의 종류
   기본 테이블의 수에 따라 단순뷰와 복합뷰로 나누어짐
   
        단순뷰                       복합뷰
   하나의 테이블로 생성           여러 개의 테이블로 생성
   그룹함수 사용 불가             그룹 함수 사용 가능
   Distinct 사용이 불가능        Distinct사용이 가능
   DML(삽입,수정,삭제) 사용가능       DML 사용 불가
 
*/

SELECT view_name, text from user_views;

drop VIEW view_emp10;
SELECT * from view_emp10;

CREATE VIEW view_emp10
as SELECT empno, ename, sal, deptno from emp01
where deptno=10;

-- 단순뷰

insert into view_emp10 values(8000,'angel','7000',10);
delete from view_emp10 where empno=8000;
-- 단순뷰를 대상으로 실행 dml 명령문의 처리 결과는 뷰를 정의할때 사용한 기본테이블에 영향을  미친다.

SELECT * from emp01;
desc view_emp10;

-- 단순 뷰의 컬럼에 별칭 사용하기
CREATE OR REPLACE view view_emp(사원번호,사원명,급여,부서번호)
as SELECT empno, ename, sal, deptno from emp01;

SELECT * from view_emp;

-- 그룹함수를 사용한 단순뷰
-- 부서별 급여 총액과 평균을 구하는 작업을 뷰로 생성해 놓고 사용하기 위함
CREATE view view_sal
as SELECT deptno, sum(sal) as "SalSum", avg(sal) as "SalAvg" from emp01
group by deptno;

SELECT * from view_sal;

-- 복합뷰 : 두 개 이상의 기본 테이블에 의해 정의한 뷰

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
-- 뷰 생성시 조건으로 지정한 컬럼 값을 변경하지 못하도록 하는것을 의미한다.
create or replace view view_chk20
as
select empno, ename, sal, comm, deptno from emp01
where deptno=20 with check option;

select * from view_chk20;

-- 급여가 5000이상인 사원을 10번부서 이동하는 쿼리문을 작성하시오.
update view_chk20 set deptno=10
where sal >=5000;

select * from view_chk20;

-- WITH READ ONLY
-- 뷰를 통해서는 기본테이블의 어떤 컬럼에 대해서도 내용을 절대 변경할수없도록 하는것을 의미한다.
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp01
where deptno=30 WITH READ ONLY;

select * from view_read30;
update view_read30 set comm=1000;

/*
with check option
  - 조건에 사용한 컬럼에 값을 수정하지 못하게 하는것
WITH READ ONLY
  - 기본 테이블의 모두를 수정하지 못하게 하는 것
*/