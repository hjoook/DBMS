

--<문제1>  commission(보너스) 컬럼의 null 인 값만 출력하되 사원번호, 사원이름,입사날짜를 출력 
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    hiredate                                 입사일자,
    commission
FROM
    employee
where commission is null	
;


--<문제2> dno(부서번호) 가 20이고 입사날짜가 81년 4월 이후 사원의 이름과 직책과 입사날짜를 출력
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee;
where dno =20 
and   hiredate >= '19810401';

--<문제3> 연봉을 계산해서 사원번호, 사원이름, 월급, 보너스, 전체 연봉을 출력
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    salary                                   월급,
    commission                               보너스,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
    order by 5 desc;


--<문제4> commission이 null 이 아닌 사용자의 이름만 출력 
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    salary                                   월급,
    commission                               보너스,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where commission is not null;

-- <문제5> manager (직급상사) 7698 인 사원이름과 직책을 출력.
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where manager= 7698
;

--<문제6> 월급이 1500 이상이고 부서가 20인 사원의 사원이름과 입사날짜, 부서번호, 월급을 출력
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where salary >= 1500
 and  dno =20
;

--<문제7> 입사날짜가 81년 4월 1일 이상이고 81년 12월 말일까지인 사원 이름과 입사날짜을 출력
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where   to_char(hiredate,'YYYYMMDD') between '19810401' and '19811231'; 


--<문제8> 직책(job) salesman 이면서 연봉이 1500 이상이면서 부서번호가 30인 사원명을 출력
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where  job = 'salesman'
and  (nvl(salary, 0) * 12 + nvl(commission, 0) )  > =1500
and dno =30;

--<문제9> 월급이 1500 이하이면서 부서번호가 20번 이 아닌 사원이름과, 월급과, 부서번호를 출력
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where  dno != 20
and  salary  <= 1500;

--<문제10> 사원번호(eno) 가 7788, 7782 인 부서번호와 이름과 직책을 출력 
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where  eno in (7788, 7782 );

--<문제11> 업무가 [SALESMAN]이 아닌 사원의 사원번호,사원이름,업무,급여 검색
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where  job <> 'SALESMAN'
;

--<문제12> 급여가 [2000]이상인 사원의 사원번호,사원이름,업무,급여 검색
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where  salary >= 2000
;

--<문제13> 사원이름이 [A],[B],[C]로 시작되는 사원의 사원번호,사원이름,업무,급여 검색
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where  substr(ename,1,1) in ('A','B','C');
;

--<문제14> [1981년 5월 1일]이전에 입사한 사원의 사원번호,사원이름,업무,급여,입사일 검색
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where   hiredate < '810501';
;

--<문제15> 업무가 [SALESMAN]인 사원 중 급여가 [1500]이상인 사원의 사원번호,사원이름,업무,급여 검색
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where   job <= 'SALESMAN'
and   salary >=1500;

--<문제16> 부서번호가 [10]이거나 업무가 [MANAGER]인 사원의 사원번호,사원이름,업무,급여,부서번호 검색
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where   dno = '10'
or   job ='MANAGER';

--<문제17> 급여가 [1000~3000]인 사원의 사원번호,사원이름,업무,급여 검색
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉
FROM
    employee
where salary between 1000 and 3000
;

select *
FROM
    employee
order by dno asc, ename desc;    


select a.dno, a.job, a.ename
FROM
    employee a
order by dno desc, job asc, ename desc;   