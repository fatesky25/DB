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
--203 ����������а� --> ��ǻ�Ͱ��а�

-- ����
update department set dname= '�̼����������а�' where deptno=203;

-- ����
delete from department where dname ='�̼����������а�';

select deptno,dname,college,loc from department