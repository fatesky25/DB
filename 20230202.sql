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

INSERT INTO tempmember VALUES('aaaa','1111','ȫ�浿', '123456','7894561','hong@naver.com', '02-1234-1234','100-100','����Ź���� �������� �žȺ��� 4��','���α׷���');
INSERT INTO tempmember VALUES('bbbb','2222','������', '123456','7894561','kim@naver.com', '02-1234-1234','200-200','���󳲵� �žȱ� �žȺ��� 4��','������');
INSERT INTO tempmember VALUES('cccc','3333','������', '123456','7894561','kang@naver.com', '02-1234-1234','100-100','������ ������ �������� 4��','����屺');

select * from tempmember;