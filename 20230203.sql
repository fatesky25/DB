-- 회원 테이블
create TABLE student(
id VARCHAR2(12) not null,
pass VARCHAR2(12) not null,
name VARCHAR2(10) not null,
phone1 VARCHAR2(3) not null,
phone2 VARCHAR2(4) not null,
phone3 VARCHAR2(4) not null,
email VARCHAR2(30) not null,
zipcode VARCHAR2(7) not null,
address1 VARCHAR2(120) not null,
address2 VARCHAR2(50) not null,
constraint student_pk primary key(id)
);

COMMIT;
desc student;
SELECT * FROM student;

CREATE TABLE zipcode (
seq number(5) not NULL,
zipcode VARCHAR2 (7) not null,
sido VARCHAR2 (6) not null,
gugun VARCHAR2 (30) not null,
dong VARCHAR2 (50) not null,
ri VARCHAR2 (80),
bunji VARCHAR2 (20),
constraint zipcode_pk primary key (seq)
);
commit;
desc zipcode;
SELECT * from zipcode;
DROP table zipcode;