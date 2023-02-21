/*
컬럼을 저의 할때 지정할 수있는 자료형

char (n)    : 고정길이 문자 데이터, 최소 크기는 1byte, 최대크기는 2000byte
varchar (n) : 가변길이 문자 데이터, 최소 크기는 1byte, 최대크기는 4000byte
number      : 숫자를 저장하는 데이터, 최소 크기는 1byte, 최대크기는 40byte
number (n)  : 지정한 n 값까지 의 크기
number (n,d): 지정한 n크기에서 소수점을 지정함(d)
date        : 날짜를 저장하는 데이터 형식
long (정수형 아님)  : 가변길이 문자 데이터 최대크기는 2gbyte
rowid (레코드에 나타나는 행번호)    : db 에 저장되어 있지 않으며 db 의 데이터도 아니다
*/

select * from emp;
desc emp;

/*
테이블 명과 컬럼명을 지정하기 위한 규칙
  1. 반드시 문자로 시작해야한다.
  1-1. 글자는 1~30글자 까지 가능하다
  3. 영문은 A~Z까지의 대소문자 숫자는 0~9까지의 숫자 특수문자(_,#,$)만가능
  4. 예약어는 사용불가
  5. 공백을 허용안함
*/

-- 사원번호, 사원명, 급여, 3개의 컬럼으로 구성된 emp01테이블을 작성하시오.
CREATE table emp01 (
--↓↓ 컬럼 지정
empno number,
ename varchar2(10),
sal number(7,2)
);

select * from tab;

--↓↓ 테이블의 구조
desc emp01;

select * from emp01;
desc emp02;

--↓↓ 테이블 복사
create table emp02
as select * from emp;

select * from tab;

--↓↓ 테이블 삭제
drop table emp02;
PURGE table emp01;
SELECT * from tab;

/*
alter table : 테이블 구조 변경
alter table 명령어는 테이블에서 컬럼의 추가, 삭제, 타입이나 길이를  변경할때 사용함

add column    : 새로운 컬럼을 추가
modify column : 기존 컬럼을 수정할때 사용함
drop column   :  컬럼을 삭제한다

형식
 alter table 테이블명
 add (컬럼명, 데이터타입);
 
해당 컬럼에 데이터가 없을 경우
 - 기존 컬럼 수정
 - 데이터 타입이나 크기만 수정
해당 컬럼에 데이터가 있을 경우
 - 컬럼에 데이터 타입은 변경 불가
 - 크기를 늘릴수 있지만 현재 가지고 있는 데이터 크기보다 작게는 변경 불가
 
 alter table 테이블명
 modify (컬럼명 데이터타입);
*/

alter table emp01
add (job varchar(9));
desc emp01;

select job, ename from emp01;
desc emp01;
select * from emp01;
--↓↓ 컬럼 수정
alter table emp01
modify(job varchar2(30));

--↓↓ 컬럼 삭제
alter table emp01
 drop column job;

/*
테이블 삭제
drop table 테이블 명
*/
select * from tab;

--↓↓ 휴지통에 저장되지 않고 바로 삭제
drop table emp01 PURGE;
--↓↓ 휴지통에 있는 테이블 지정해서 지우기
PURGE table emp01;
--↓↓ 휴지통 전체 비우기
PURGE RECYCLEBIN;
--↓↓ 휴지통에 있는 테이블 복원
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
테이블에 내용을 추가,수정,삭제 (DML)
insert into, update set, delete from
select

insert(추가)
특정한 컬럼에 데이터 추가
insert into 테이블명(컬럼1,컬럼2...),values(값1,값2,...);
모든 컬럼에 데이터 추가
insert into 테이블명 values(값1,값2,...);
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
테이블의 내용을 수정
UPDATE 테이블명
SET 컬럼명1=값1,컬럼명2 =값2
where = 조건

update문은 기존의 행을 수정하는 것
어떤 데이터를 수정하는지 where절을 이용하여 조건을 지정함
where 절을 생략시에는 모든행이 수정됨
*/
select * from emp;
select * from emp01;

drop table emp01;

CREATE table emp01 as select * from emp;

update emp01 set deptno=30;
rollback;

-- 모든 사원의 급여를 10% 인상하시오.
-- 1.1
update emp01 set sal=sal*1.1;
select * from emp01;
update emp01 set hiredate=sysdate;
update emp01 set deptno=30 where deptno=10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
update emp01 set sal=sal*1.1 where sal >=3000;

-- 87년도에 입사한 사원의 입사일을 오늘로 출력
update emp01 set hiredate=sysdate where substr(hiredate,1,2)='87'; 

rollback;

select * from emp01;

-- 사원의 이름이 scott의 부서번호 10번으로 변경 직급은 manager로 변경하시오.

update emp01 set deptno=10,job='MANAGER' where ename='SCOTT';

-- 사원의 이름이 scott의 입사일을 오늘로,급여 50,커미션 4000으로변경하시오.

update emp01 set hiredate=sysdate , sal= 50,comm=4000 where enmae='SCOTT';

-- 테이블에 불필요한 행을 삭제하기 위한 delete
-- delete from 테이블명 where 조건;
drop table dept01;
-- create table dept01 as
select * from dept01;
delete from dept01;
rollback;
delete from dept01 where deptno=30;

/*
다음 명세를 참조 하여 Employee 테이블을 생성하시오.

사원번호 숫자(4)자리,
사원이름 문자(10)자리
직급    문자(9)자리
상관    숫자(4),
입사일   날짜형
급여    숫자(7,2)
커미션   숫자(7,2)
부서번호  숫자(2)

데이터 추가
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