select * from tab;

--������ �ִ� ���̺� ����
drop TABLE employee;
purge recyclebin;
-- ���� Ȯ��
select * from employee;


-- ���̺� ����
create table employee(
no number not null,
name varchar2(20) not null,
jobgrade varchar2(10) ,
department number,
email VARCHAR2(20),
constraint no_pk primary key(no)
);

-- ������ ����
create sequence employee_seq
start with 1
increment by 1
NOCYCLE;

commit;
select * from employee;
desc employee;



