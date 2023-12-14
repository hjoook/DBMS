
--1��
selecT  ename                                    �����,
        dno                                      �μ���ȣ 
FROM     employee
where eno =7788
;

-- 2��
SELECT    
    ename                                    �����,
    hiredate                                 �Ի�����
FROM
    employee
where  hiredate like  '81_%';

--3��
SELECT
    ename                                    �����,
    job                                      ��å,
    salary                                   ���� 
FROM employee
 where job in ('CLERK','SALESMAN')
 and  salary not  in (950,1600,1300)
 ;

--4��
select trunc(MONTHS_BETWEEN(sysdate , to_date('19780807') ))
from dual;  

--5��
select dno, round(avg(salary),2)
from employee
group by dno
having round(avg(salary),2) > 2000
order by dno desc
;

-- 6��
select ename �̸�, salary �޿�, job ��å, dno �μ���ȣ
from employee
where salary > (
        -- ��ü ����� select �ϴ� ���� �ۼ� 
        select round ( avg(salary) , 2) from employee        
    )  
order by salary desc ;  

--7��  
select job ��å, ename ����̸�, e.dno �μ���ȣ, dname �μ���, loc �μ���ġ
from emp01 e JOIN dept01 d 
on e.dno = d.dno
where job = 'MANAGER'
order by ename; 

--8��
create view v_join 
as
select ename ����̸�, job ��å, dname �μ���, loc �μ���ġ
from employee e 
    join department d 
        on e.dno  = d.dno 
where salary in (
    -- �μ����� �ּ� ���� 
    select min(salary) from employee 
    where dno <> 20 
    group by dno 
    having min(salary) > 900 
);

--9��
create table EMP50
as
select * from employee;

create table DEPT50
as
select * from department;

desc employee;
desc department;

alter table EMP50 
add constraint PK_EMP50_ENO primary key (ENO) ; 

alter table EMP50 
add constraint FK_EMP50_DNO foreign key (dno) references dept50(dno); 

alter table DEPT50 
add constraint PK_DEPT50_DNO primary key (dno) ; 


--10��
--10.1
insert into EMP50 ( eno, ename, job, manager, hiredate, salary, commission, dno )
values ( 8181, 'ȫ�浿', '�繫��', 7788 , sysdate, 1000 , 100 , 20 ); 
commit;
--10.2
selecT * from EMP50 where commission is null;
update  EMP50 
set  commission = 50
where commission is null;
commit;
--10.3
selecT *
from DEPT50 where dno=40;

update DEPT50
set dname = '���'
  , loc = '����'
where  dno=40;
commit;

--10.4 
selecT  * from EMP50 where job ='MANAGER';

delete from EMP50 where job ='MANAGER';
commit;




