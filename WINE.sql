CREATE TABLE sale (
    sale_date DATE NOT NULL PRIMARY KEY ,
    wine_code VARCHAR2(6) NOT NULL,
    mem_id VARCHAR2(30) NOT NULL,
    sale_amount VARCHAR2(5) NOT NULL ,
    sale_price VARCHAR2(6) NOT NULL ,
    sale_tot_price VARCHAR2(15) NOT NULL 
);


CREATE TABLE dddd (
    sale_date DATE  PRIMARY KEY    NOT NULL ,
    wine_code VARCHAR2(6) NOT NULL,
    mem_id VARCHAR2(30) NOT NULL,
    sale_amount VARCHAR2(5) DEFAULT '0' NOT NULL ,
    sale_price VARCHAR2(6) DEFAULT '0'  NOT NULL ,
    sale_tot_price VARCHAR2(15) DEFAULT '0' NOT NULL 
);


insert into dddd
selecT * from sale;

drop table sale ;

rename dddd to sale; 

commit; 
ALTER TABLE sale
ADD CONSTRAINT fk_wine_code FOREIGN KEY (wine_type_code) REFERENCES wine_type(wine_type_code);

alter sale CONSTRAINT fk_wine_code FOREIGN KEY (wine_code) REFERENCES wine(wine_code);
 
 CREATE TABLE sale120 (
    sale_date DATE NOT NULL PRIMARY KEY ,
    wine_code VARCHAR2(6) NOT NULL,
    mem_id VARCHAR2(30) NOT NULL,
    sale_amount VARCHAR2(5) NOT NULL ,
    sale_price VARCHAR2(6) NOT NULL ,
    sale_tot_price VARCHAR2(15) default 'n' NOT NULL
);

drop table sale120;
selecT * from sale;
commit;

drop table member40;

CREATE TABLE member40 (
    mem_id VARCHAR2(6) NOT NULL PRIMARY KEY,
    mem_grade VARCHAR2(20),
    mem_pw VARCHAR2(20) NOT NULL,
    mem_birth DATE NOT NULL, 
    mem_tel VARCHAR2(20),
    mem_pt VARCHAR2(10) NOT NULL 
);


CREATE TABLE member50 (
    mem_id VARCHAR2(6) NOT NULL PRIMARY KEY,
    mem_grade VARCHAR2(20),
    mem_pw VARCHAR2(20) NOT NULL,
    mem_birth DATE NOT NULL 
    mem_tel VARCHAR2(20),
    mem_pt VARCHAR2(10) DEFAULT '0' NOT NULL 
);
selecT * from member40;


CREATE TABLE grade_pt_rate (
    mem_grade VARCHAR2(20) NOT NULL PRIMARY KEY,
    grade_pt_rate NUMBER(3,2) NOT NULL
);


CREATE TABLE today (
    today_code VARCHAR2(6) NOT NULL PRIMARY KEY,
    today_sens_value NUMBER(3),
    today_intell_value NUMBER(3),
    today_phy_value NUMBER(3)
);

CREATE TABLE nation (
    nation_code VARCHAR2(26) NOT NULL PRIMARY KEY,
    nation_name VARCHAR2(50) NOT NULL
);


select * from nation;


select * from wine_type;

selecT * from theme;


select * from today;

selecT * from fk_wine_code;


create table fk_manager_id
as
selecT * from manager;

create table fk_wine_code
as
select * from wine_type;


CREATE TABLE wine (
    wine_code VARCHAR2(26) NOT NULL PRIMARY KEY,
    wine_name VARCHAR2(100) NOT NULL,
    wine_url BLOB,
    nation_code VARCHAR2(6),
    wine_type_code VARCHAR2(6),
    wine_sugar_code NUMBER(2),
    wine_price NUMBER(15) NOT NULL ,
    wine_vintage DATE,
    theme_code VARCHAR2(6),
    today_code VARCHAR2(6),
    CONSTRAINT fk_nation FOREIGN KEY (nation_code) REFERENCES nation(nation_code),
    CONSTRAINT fk_wine_type FOREIGN KEY (wine_type_code) REFERENCES wine_type(wine_type_code),
    CONSTRAINT fk_theme FOREIGN KEY (theme_code) REFERENCES theme(theme_code),
    CONSTRAINT fk_today FOREIGN KEY (today_code) REFERENCES today(today_code)
);

   
   CREATE TABLE wine_type (
    wine_type_code VARCHAR2(6) NOT NULL PRIMARY KEY,
    wine_type_name VARCHAR2(50)
);


CREATE TABLE theme (
    theme_code VARCHAR2(6) NOT NULL PRIMARY KEY,
    theme_name VARCHAR2(50) NOT NULL
);

CREATE TABLE stock_management (
    stock_code VARCHAR2(6) NOT NULL PRIMARY KEY,
    wine_code VARCHAR2(6),
    manager_id VARCHAR2(30),
    ware_date DATE NOT NULL ,
    stock_amount NUMBER(5) NOT NULL ,
    CONSTRAINT fk_wine_code FOREIGN KEY (wine_code) REFERENCES wine(wine_code),
    CONSTRAINT fk_manager_id FOREIGN KEY (manager_id) REFERENCES member40(mem_id)
);

CREATE TABLE manager (
    manager_id VARCHAR2(30) NOT NULL PRIMARY KEY,
    manager_pwd VARCHAR2(20) NOT NULL,
    manager_tel VARCHAR2(20)
);

selecT * from member40;


INSERT INTO stock_management (stock_code, wine_code, manager_id,ware_date, stock_amount)
VALUES 

    
    

    ('S005', 'W005', 'user5',sysdate, 90);


desc wine;
selecT * from today;



