
--1번
selecT  ename                                    사원명,
        dno                                      부서번호 
FROM     employee
where eno =7788
;

-- 2번
SELECT    
    ename                                    사원명,
    hiredate                                 입사일자
FROM
    employee
where  hiredate like  '81_%';

--3번
SELECT
    ename                                    사원명,
    job                                      직책,
    salary                                   월급 
FROM employee
 where job in ('CLERK','SALESMAN')
 and  salary not  in (950,1600,1300)
 ;

--4번
select trunc(MONTHS_BETWEEN(sysdate , to_date('19780807') ))
from dual;  

--5번
select dno, round(avg(salary),2)
from employee
group by dno
having round(avg(salary),2) > 2000
order by dno desc
;

-- 6번
select ename 이름, salary 급여, job 직책, dno 부서번호
from employee
where salary > (
        -- 전체 평균을 select 하는 쿼리 작성 
        select round ( avg(salary) , 2) from employee        
    )  
order by salary desc ;  

--7번  
select job 직책, ename 사원이름, e.dno 부서번호, dname 부서명, loc 부서위치
from emp01 e JOIN dept01 d 
on e.dno = d.dno
where job = 'MANAGER'
order by ename; 

--8번
create view v_join 
as
select ename 사원이름, job 직책, dname 부서명, loc 부서위치
from employee e 
    join department d 
        on e.dno  = d.dno 
where salary in (
    -- 부서별로 최소 월급 
    select min(salary) from employee 
    where dno <> 20 
    group by dno 
    having min(salary) > 900 
);

--9번
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


--10번
--10.1
insert into EMP50 ( eno, ename, job, manager, hiredate, salary, commission, dno )
values ( 8181, '홍길동', '사무원', 7788 , sysdate, 1000 , 100 , 20 ); 
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
set dname = '운영부'
  , loc = '서울'
where  dno=40;
commit;

--10.4 
selecT  * from EMP50 where job ='MANAGER';

delete from EMP50 where job ='MANAGER';
commit;




