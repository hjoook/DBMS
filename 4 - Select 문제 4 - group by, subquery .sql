/*     group by , subquery 문제 

모든 평균은 소숫점 2자리까지 출력하되 반올림 해서 출력 하시오.  
1.  10 번 부서를 제외하고 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오. 부서번호를 오름차순 정렬 하세요.  
2.  직책의 SALSMAN, PRESIDENT, CLERK 을 제외한 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오.   	
3. SMITH 과 동일한 부서에 근무하는 사원들 의 월급의 합계와 평균과 최대값, 최소값을 구하시오. 
4. group by - 부서별 최소월급을 가져오되 최소월급이 1000 이상인 것만 출력하세요. 
5. group by - 부서별 월급의 합계가 9000 이상것만 출력
6. group by - 부서별 월급의 평균이 2000 이상만 출력 하되 부서번호를  오름차순으로 출력
7. group by - 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력 하라. 
8. sub query - 부서별로 최소 급여를 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요. 
9. sub query - 전체 평균 급여보다 많이 받는 사용자의  이름과 급여와 직책과 부서번호를 출력하세요. 
10. sub query - 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해 오름차순 정렬하시오. 

       :  완료시간 : 17: 30분 
*/ 
1.  10 번 부서를 제외하고 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오. 부서번호를 오름차순 정렬 하세요. 
select  dno 부서번호, count(*) , SUM (salary) , round ( avg(salary), 2) , max(salary), min (salary) 
from employee 
--where dno != 10         -- <> ,  ^= 
where dno not in (10) 
group by dno                -- 같은 부서를 그룹핑 
order by dno asc ; 

2.  직책의 SALSMAN, PRESIDENT, CLERK 을 제외한 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오.  
select  dno 부서번호, count(*) , SUM (salary) , round ( avg(salary), 2) , max(salary), min (salary) 
from employee 
where job not in ('SALSMAN', 'PRESIDENT', 'CLERK') 
group by dno                -- 같은 부서를 그룹핑 
 
3. SMITH 과 동일한 부서에 근무하는 사원들 의 월급의 합계와 평균과 최대값, 최소값을 구하시오.

select dno 부서번호, count(*) , SUM (salary) , round ( avg(salary), 2) , max(salary), min (salary) 
from employee
where dno = ( select dno from employee where ename = 'SMITH'  )
group by dno 

4. group by - 부서별 최소월급을 가져오되 최소월급이 1000 이상인 것만 출력하세요. 

select dno , min (salary) 
from employee
group by dno 
having min (salary) >= 1000; 

5. group by - 부서별 월급의 합계가 9000 이상것만 출력
select dno , sum (salary) 
from employee
group by dno 
having sum (salary) >= 9000; 

6. group by - 부서별 월급의 평균이 2000 이상만 출력 하되 부서번호를  오름차순으로 출력

select dno , round( avg (salary) , 2) 
from employee
group by dno 
having round( avg (salary) , 2)  >= 2000; 

7. group by - 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력 하라. 

select dno  , round( avg (salary) , 2) 
from employee
where salary > 1500 
group by dno 
having round( avg (salary) , 2) >= 2500 ;  

8. sub query - 부서별로 최소 급여를 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요. 

select ename 이름, salary 급여, job 직책 , dno 부서번호 
from employee 
where salary in (
        -- 부서별 최소 월급 을 출력 하는 select 
        select min(salary) 
        from employee
        group by dno 
); 

9. sub query - 전체 평균 급여보다 많이 받는 사용자의  이름과 급여와 직책과 부서번호를 출력하세요. 

select ename 이름, salary 급여, job 직책, dno 부서번호
from employee
where salary > (
        -- 전체 평균을 select 하는 쿼리 작성 
        select round ( avg(salary) , 2) from employee 
        
    ) ; 


10. sub query - 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해 오름차순 정렬하시오. 

select ename 이름, salary 급여, job 직책, dno 부서번호
from employee
where salary > (
        -- 전체 평균을 select 하는 쿼리 작성 
        select round ( avg(salary) , 2) from employee 
        
    )  
order by salary asc ;     