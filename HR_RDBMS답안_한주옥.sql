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
;


-- 6번
select ename 이름, salary 급여, job 직책, dno 부서번호
from employee
where salary > (
        -- 전체 평균을 select 하는 쿼리 작성 
        select round ( avg(salary) , 2) from employee        
    )  
order by salary asc ;  

--7번  
select job 직책, ename 사원이름, e.dno 부서번호, dname 부서명, loc 부서위치
from emp01 e JOIN dept01 d 
on e.dno = d.dno
where job = 'MANAGER'; 

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
. 테이블 복사및 alter table 을 사용하여 복사한 원본 테이블과 같은 제약 조건을 추가 하시오 
   employee 테이블의 모든 컬럼과 값을 복사하여 EMP50 테이블을 생성하시오
   department 테이블의 모든 컬럼과 값을 복사하여 DEPT50 테이블을 생성하시오. 
   원본 테이블에 부여된 제약조건을 복사된 테이블에도 부여 하시오 

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





