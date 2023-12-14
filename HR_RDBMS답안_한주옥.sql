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
;


-- 6��
select ename �̸�, salary �޿�, job ��å, dno �μ���ȣ
from employee
where salary > (
        -- ��ü ����� select �ϴ� ���� �ۼ� 
        select round ( avg(salary) , 2) from employee        
    )  
order by salary asc ;  

--7��  
select job ��å, ename ����̸�, e.dno �μ���ȣ, dname �μ���, loc �μ���ġ
from emp01 e JOIN dept01 d 
on e.dno = d.dno
where job = 'MANAGER'; 

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
. ���̺� ����� alter table �� ����Ͽ� ������ ���� ���̺�� ���� ���� ������ �߰� �Ͻÿ� 
   employee ���̺��� ��� �÷��� ���� �����Ͽ� EMP50 ���̺��� �����Ͻÿ�
   department ���̺��� ��� �÷��� ���� �����Ͽ� DEPT50 ���̺��� �����Ͻÿ�. 
   ���� ���̺� �ο��� ���������� ����� ���̺��� �ο� �Ͻÿ� 

create table EMP50
as
select * from employee;

create table DEPT50
as
select * from department;

desc employee;

desc department;

alter table EMP50  modify eno NOT NULL ; 

alter table DEPT50  modify dno NOT NULL ; 





