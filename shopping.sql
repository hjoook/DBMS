CREATE TABLE member20 (
    id VARCHAR2(20) PRIMARY KEY NOT NULL,
    pwd VARCHAR2(20),
    name VARCHAR2(50),
    zipcode VARCHAR2(7),
    address VARCHAR2(20),
    tel VARCHAR2(13),
    indate DATE DEFAULT SYSDATE
);
delete  from member20;

commit;



INSERT INTO member20 (id, pwd, name, zipcode, address, tel, indate)
VALUES ('user1', '1111', 'John Doe', '12345', '서울시1', '123-456-7890', SYSDATE);

INSERT INTO member20 (id, pwd, name, zipcode, address, tel, indate)
VALUES ('user2', '1212', 'Jane Smith', '67890', '경기도2', '987-654-3210', SYSDATE);

INSERT INTO member20 (id, pwd, name, zipcode, address, tel, indate)
VALUES ('user3', '2222', 'Bob Johnson', '54321', '부산시', '111-222-3333', SYSDATE);

INSERT INTO member20 (id, pwd, name, zipcode, address, tel, indate)
VALUES ('user4', '3333', 'Alice Williams', '98765', '경기도', '444-555-6666', SYSDATE);

INSERT INTO member20 (id, pwd, name, zipcode, address, tel, indate)
VALUES ('user5', '4444', 'Eva Davis', '13579', '서울시5', '777-888-9999', SYSDATE);


CREATE TABLE zipcode20 (
    zipcode VARCHAR2(7) PRIMARY KEY NOT NULL,
    sido VARCHAR2(30),
    gugum VARCHAR2(30),
    dong VARCHAR2(30),
    bungi VARCHAR2(30)
);

rename orders to orders20;

INSERT INTO zipcode20 (zipcode, sido, gugum, dong, bungi)
VALUES ('12345', '서울', '강남구', '역삼동', '123');

INSERT INTO zipcode20 (zipcode, sido, gugum, dong, bungi)
VALUES ('67890', '경기', '성남시', '분당구', '456');

INSERT INTO zipcode20 (zipcode, sido, gugum, dong, bungi)
VALUES ('54321', '부산', '사하구', '사하동', '123');

INSERT INTO zipcode20 (zipcode, sido, gugum, dong, bungi)
VALUES ('98765', '경기', '하남시', '하남동', '456');

INSERT INTO zipcode20 (zipcode, sido, gugum, dong, bungi)
VALUES ('13579', '서울', '종로구', '인사동', '456');



CREATE TABLE products20 (
    product_code VARCHAR2(20) PRIMARY KEY NOT NULL,
    product_name VARCHAR2(100),
    product_kind CHAR(1),
    product_price1 VARCHAR2(10),
    product_price2 VARCHAR2(10),
    product_content VARCHAR2(1000),
    product_image VARCHAR2(50),
    sizeSt VARCHAR2(5),
    sizeEt VARCHAR2(5),
    product_quantity VARCHAR2(5),
    useyn CHAR(1),
    indate DATE
);


INSERT INTO products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
VALUES ('P001', '플젝 A', 'A', '5000', '10000', 'Description of Product A', 'image_A.jpg', 'S', 'XL', '100', 'Y', SYSDATE);

INSERT INTO products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
VALUES ('P002', '플젝 B', 'B', '7000', '12000', 'Description of Product B', 'image_B.jpg', 'M', 'L', '50', 'Y', SYSDATE);

INSERT INTO products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
VALUES ('P003', '플젝 C', 'C', '10000', '13000', 'Description of Product C', 'image_C.jpg', 'S', 'S', '90', 'N', SYSDATE);

INSERT INTO products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
VALUES ('P004', '플젝 D', 'D', '15000', '14000', 'Description of Product D', 'image_D.jpg', 'M', 'M', '95', 'N', SYSDATE);

INSERT INTO products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
VALUES ('P005', '플젝 E', 'E', '17000', '15000', 'Description of Product E', 'image_E.jpg', 'SL', 'XL', '105', 'Y', SYSDATE);

CREATE TABLE orders20 (
    o_seq NUMBER(10) PRIMARY KEY NOT NULL,
    product_code VARCHAR2(20),
    id VARCHAR2(16),
    product_size VARCHAR2(5),
    quantity VARCHAR2(5),
    result CHAR(1),
    indate DATE,
    CONSTRAINT fk_orders20_products20 FOREIGN KEY (product_code) REFERENCES products20 (product_code),
    CONSTRAINT fk_orders20_members FOREIGN KEY (id) REFERENCES member20 (id)
);


INSERT INTO orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
VALUES (1, 'P001', 'user1', 'M', '2', 'Y', SYSDATE);

INSERT INTO orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
VALUES (2, 'P002', 'user2', 'L', '1', 'N', SYSDATE);

INSERT INTO orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
VALUES (3, 'P003', 'user3', 'XL', '3', 'Y', SYSDATE);

INSERT INTO orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
VALUES (4, 'P004', 'user4', 'S', '4', 'N', SYSDATE);

INSERT INTO orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
VALUES (5, 'P005', 'user5', 'M', '5', 'Y', SYSDATE);

INSERT INTO orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
VALUES (6, 'P001', 'user2', 'L', '1', 'N', SYSDATE);



selecT * from member20;
selecT * from zipcode20;
select * from products20;
select * from orders20;


selecT  a.* 
     ,  b.*
     ,  c.*
     ,  d.*
from  member20 a
inner join zipcode20 b
        on a.zipcode = b.zipcode   
inner join orders20 c
        on a.id =  c.id   
inner join products20 d
        on c.product_code = d.product_code
        ;

