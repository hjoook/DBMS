
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee;
    
    
selecT *
from DEPARTMENT;

selecT *  from dept01;


create table emp01
as
select * from employee;

create table dept01
as
select * from DEPARTMENT;

drop table emp01;

--���̺��� ��������Ȯ��
selecT * from user_constraints where table_name in ('EMPLOYEE','DEPARTMENT');
selecT * from user_constraints where table_name in ('EMP01','DEPT01');

--PRIMARY key 
alter table dept01
add CONSTRAINT pk_pept01_dno PRIMARY key (dno);
--PRIMARY key
alter table emp01
add CONSTRAINT pk_emp01_eno PRIMARY key(eno);
--FOREIGN key
alter table emp01
add CONSTRAINT fk_emp01_dno FOREIGN key(dno) REFERENCES dept01(dno);

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

INSERT INTO dept01 VALUES (50,'HR','SEOUL');
INSERT INTO dept01 VALUES (60,'MANAGE','BUSAN');

COMMIT;

--equi join
select a.*, b.*
from emp01 a,
     dept01 b
     where a.dno  = b.dno;

-- ansi join inner join     
select a.*, b.*
from emp01 a 
inner join   dept01 b
     on  a.dno  = b.dno   ;  
     
select a.*, b.*
from emp01 a 
inner join   dept01 b
     on  a.dno  = b.dno   
where a.dno = 20     ;       


select a.*, b.*
from emp01 a 
right outer join   dept01 b
     on  a.dno  = b.dno   
  ; 
  
  select a.*, b.*
from emp01 a 
full outer join   dept01 b
     on  a.dno  = b.dno   
  ; 
  
  --self join
  select a.eno, a.ename, a.manager, b.eno, b.ename, b.manager
from emp01 a 
 join   emp01 b
 on  a.MANAGER  = b.eno   
  ;   
  
  select a.*, b.*
from emp01 a 
inner join   dept01 b
     on  a.dno  = b.dno   
where a.ename ='SCOTT'     ;  
  
  select a.eno, a.ename, a.manager, b.eno, b.ename, b.manager
from emp01 a 
left outer join   emp01 b
 on  a.MANAGER  = b.eno   ;
 
   
  select a.eno, a.ename, a.manager, b.eno, b.ename, b.manager
from emp01 a 
right outer join   emp01 b
 on  a.MANAGER  = b.eno   ;
 
  select a.eno, a.ename, a.manager, b.eno, b.ename, b.manager
from emp01 a 
full outer join   emp01 b
 on  a.MANAGER  = b.eno   ;
 
 select a.*, b.*
from emp01 a 
inner join   dept01 b
     on  a.dno  = b.dno  
where      a.job ='MANAGER'
order by 1 desc ;

     
/*
    JOIN �ǽ� 
        member10 : ȸ�������� �����ϴ� ���̺� 
        zipcode10 : �����ȣ�� �����ϴ� ���̺� 
        product10 : ��ǰ ������ �����ϴ� ���̺� 
        order10 : �ֹ� ������ �����ϴ� ���̺� 
*/

create table zipcode10 (
        zipcode number(6) not null constraint PK_ZIPCODE10_ZIPCODE Primary key, 
        si_do varchar2(200) not null, 
        gu_gun varchar2(200) not null, 
        bungi varchar2(200) not null
) ; 

create table member10 (
        m_id number(4) not null constraint PK_MEMBER10_M_ID primary key, 
        pass varchar2(200) not null , 
        name varchar2(200) not null, 
        email varchar2(200) not null , 
        zipcode number(6) null , 
        -- Foreign Key ���� ���� �߰���. : member10(zipcode)  ===> zipcode10(zipcode) 
            constraint FK_MEMBER10_ZIPCODE foreign key (zipcode) references ZIPCODE10(zipcode) 
); 

create table product10 (
        pro_id number(6) not null constraint PK_PRODUCT10_PRO_ID primary key , 
        pro_name varchar2(200) not null, 
        pro_price number(7,2) not null , 
        pro_cnt number(4) default 0 not null 
);




create table order10 (
    ord_id number(6) not null constraint PK_ORDER10_ORD_ID primary key, 
    m_id  number(4) not null,      -- FK  : MEMBER10(m_id)
    pro_id number(6) not null,    -- FK  : PRODUCT10 (pro_id) 
        -- Foreign Key 2�� 
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10(m_id), 
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10(pro_id)   
);

create table order11 (
    o_id number(6) not null primary key, 
    m_name varchar2(200) not null , -- �ֹ����̸�
    m_phone varchar2(200) not null , -- �ֹ��� ����ó
    m_addr varchar2(200) not null , -- �ֹ��� �ּ�
    m_email varchar2(200) not null,  -- �ֹ��� �����ּ�
    p_id  number(6) not null,      -- ��ǰ��ȣ
    p_name varchar2(200) not null ,  -- ��ǰ�̸�
    p_price number(7,2) not null,   -- ��ǰ����
    p_cnt  number(6)       null    -- ��ǰ����
);
-- �� ���̺� ���ڵ� 5���� �ֽ��ϴ�. 


INSERT INTO zipcode10 VALUES(16303,'����Ư����','������','������17��');
INSERT INTO zipcode10 VALUES(12410,'��⵵','����','����ϱ� 10');
INSERT INTO zipcode10 VALUES(63565,'����Ư����ġ��','��������','�ż���48����');
INSERT INTO zipcode10 VALUES(46706,'�λ걤����','����','��Ϲ�����3����');
INSERT INTO zipcode10 VALUES(59222,'���󳲵�','������','������ǳ��');

INSERT INTO member10 VALUES(1,'1234','���ﱺ','Gangnam@gmail.com',16303);
INSERT INTO member10 VALUES(2,'1111','��ⱺ','Gapyeong@gmail.com',12410);
INSERT INTO member10 VALUES(3,'2222','���ֱ�','Jeju-do@naver.com',63565);
INSERT INTO member10 VALUES(4,'3333','�λ걺','Busan@daum.com',46706);
INSERT INTO member10 VALUES(5,'4444','����','Gangjin-gun@naver.com',59222);
INSERT INTO member10 VALUES(6,'1212','����1','Gangjin-gun@naver.com',59222);
INSERT INTO member10 VALUES(7,'1212','���ﱺ1','kangdong@naver.com',16303);

INSERT INTO product10 VALUES(1,'����',20000,1200);
INSERT INTO product10 VALUES(2,'�Ȱ�',15000,1000);
INSERT INTO product10 VALUES(3,'�ڵ���',50000,5000);
INSERT INTO product10 VALUES(4,'������',25000,250);
INSERT INTO product10 VALUES(5,'����',75000,750);

INSERT INTO order10 VALUES(10,1,5);
INSERT INTO order10 VALUES(20,2,4);
INSERT INTO order10 VALUES(30,3,3);
INSERT INTO order10 VALUES(40,4,2);
INSERT INTO order10 VALUES(50,5,1);
INSERT INTO order10 VALUES(60,2,1);
INSERT INTO order10 VALUES(80,3,4);

insert into order11 values (10,'���ﱺ','010-1234-1243','����Ư���� ������', 'Gangnam@gmail.com',1,'����',2000,5);
insert into order11 values (20,'����1','010-4343-4321','���󳲵� ������', 'Gangjin-gun@naver.com',2,'�Ȱ�',15000,4);


select * from zipcode10;
SELECt * FROM member10;
selecT * from product10;
selecT * from order10;

COMMIT;

--���̺� ����  : Foreign Key�� �����ϴ� ���̺��� ������ ���� �ʴ´�.  cascade constraints  
--             �������̺� ���� ����
--       cascade constraints  ����� ������ ����
drop table  zipcode10;
drop table  member10;
drop table  product10;
drop table  order10;

-- ANSI JOIN ���� ����ؼ� �ֹ�����(Order10)���̺��� �������� 
     -- �ֹ��ڸ�, �ֹ��ڸ����ּ�, �ֹ��ڹ���(�õ�), �ֹ���ǰ��, ��ǰ�� ������ ��� �մϴ�.   , 
     --order10, member10, zipcode10, product10
     
     
select a.name
     , a.email
	 , b.zipcode
	 , b.si_do
     , d.pro_name
     , d.pro_price
from member10 a
inner join zipcode10 b
        on a.zipcode = b.zipcode
inner join order10 c
        on a.m_id  = c.m_id
inner join product10  d
        on c.pro_id = d.pro_id
;

select a.name
     , a.email
	 , b.zipcode
	 , b.si_do
from member10 a
right outer join zipcode10 b
        on a.zipcode = b.zipcode
;

select  d.pro_name
     , d.pro_price
from order10 c
    join product10  d
        on c.pro_id = d.pro_id
;        
  select a.eno, a.ename, a.manager, b.eno, b.ename, b.manager
from emp01 a 
full outer join   emp01 b
 on  a.MANAGER  = b.eno   ;
 
 select a.*, b.*
from emp01 a 
inner join   dept01 b
;

grant create view to C##HR;


selecT * from v_emp01;

CREATE VIEW v_emp01
AS
SELECT ename, job, dno
FROM emp01;
    
selecT * from user_views;    




create view v_emp03
as 
 select a.dno, a.salary , a.ename, a.job, b.dname, b.loc
from employee a 
inner join   DEPARTMENT b
on a.dno = b.dno
where a.dno <> 20
order by a.dno , a.salary
;

selecT * from v_emp01;

drop view v_emp03;
delete from v_emp01 where job ='CLERK';


create view v_test01
as 
 select a.dno, a.salary , a.ename, a.job, b.dname, b.loc
from employee a 
inner join   DEPARTMENT b
on a.dno = b.dno
where a.dno <> 20
order by a.dno , a.salary 
;

selecT * from emp01;
-- view ���� ������Ʈ �μ�Ʈ ���� �ϸ� �����̺� ����
delete from v_emp01 where job ='CLERK';

select * from emp01 where job ='CLERK';

alter table  emp01 modify dno not null;;

selecT * from v_emp01;