select * from tab;

--기존에 있던 테이블 삭제
drop TABLE employee;
purge recyclebin;
-- 삭제 확인
select * from employee;


-- 테이블 생성
create table employee(
no number not null,
name varchar2(20) not null,
jobgrade varchar2(10) ,
department number,
email VARCHAR2(20),
constraint no_pk primary key(no)
);

-- 시퀀스 생성
create sequence employee_seq
start with 1
increment by 1
NOCYCLE;

commit;
select * from employee;
desc employee;



