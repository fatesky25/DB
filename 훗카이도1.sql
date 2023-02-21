CREATE TABLE stock (
num NUMBER (5) not null,
value NUMBER(5) DEFAULT 0 not NULL,
CONSTRAINT stock_pk PRIMARY KEY(num)
);

COMMIT;

INSERT into stock VALUES(1, 390);
INSERT into stock VALUES(2, 403);
INSERT into stock VALUES(3, 302);
INSERT into stock VALUES(4, 252);
INSERT into stock VALUES(5, 370);
INSERT into stock VALUES(6, 290);
INSERT into stock VALUES(7, 305);
INSERT into stock VALUES(8, 300);
INSERT into stock VALUES(9, 380);
INSERT into stock VALUES(10, 280);

SELECT * from stock;