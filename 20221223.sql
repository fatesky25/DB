select * from tab;
show user;

create TABLE professor(
profno        NUMBER(5) not null,
name          VARCHAR2 (10) not null,
ename         VARCHAR2 (20) not null,
position      VARCHAR2 (20) not null,
sal           number(4) not null,
hiredate      date not null,
age           number(3) not null,
deptno        number(3) not null,
CONSTRAINT professor_pk primary key(profno)
);

alter TABLE professor add CONSTRAINT professor_fk
FOREIGN key (deptno)
REFERENCES department(deptno); 

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM user_constraints WHERE TABLE_NAME='DEPARTMENT';

COMMIT;

SELECT * from professor;

select a.name, a.profno, a.position, b.dname
from professor a, department b
where a.deptno=b.deptno and a.deptno=203; --¡∂¿Œ\

SELECT * from department;

delete from department where deptno=100;


