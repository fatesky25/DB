select *from tab;

create table department (
deptno number(3) not null,
dname varchar2(30) not null,
college number(3) not null,
loc varchar2(10) not null,
CONSTRAINT department_pk PRIMARY key(deptno)
);

desc department;
commit;

select * from department;
DELETE from department;
--203 제어계측공학과 --> 컴퓨터공학과

-- 수정
update department set dname= '이세계축제공학과' where deptno=203;

-- 삭제
delete from department where dname ='이세계축제공학과';

select deptno,dname,college,loc from department