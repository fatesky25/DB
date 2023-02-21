CREATE TABLE tempmember (
id VARCHAR2(20) not null,
passwd VARCHAR2(20),
name VARCHAR2(20),
mem_num1  VARCHAR2(6),
mem_num2  VARCHAR2(7),
e_mail  VARCHAR2(30),
phone  VARCHAR2(30),
zipcode VARCHAR2(7),
address VARCHAR2(80),
job VARCHAR2(30),
PRIMARY key(id)
);
desc tempmember;

INSERT INTO tempmember VALUES('aaaa','1111','홍길동', '123456','7894561','hong@naver.com', '02-1234-1234','100-100','서울탁별시 영등포구 신안빌딩 4층','프로그래머');
INSERT INTO tempmember VALUES('bbbb','2222','김유신', '123456','7894561','kim@naver.com', '02-1234-1234','200-200','전라남도 신안군 신안빌딩 4층','개발자');
INSERT INTO tempmember VALUES('cccc','3333','강감찬', '123456','7894561','kang@naver.com', '02-1234-1234','100-100','개성시 개성읍 개성빌딩 4층','고려장군');

select * from tempmember;