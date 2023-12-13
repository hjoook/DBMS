--1. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력 하시오. 
SELECT
hiredate,
    substr(to_char(hiredate,'YYYYMMDD'),1,4)   년도
    , substr(to_char(hiredate,'YYYYMMDD'),5,2) 달
FROM
    employee
;



--2. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력 하시오.
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
where substr(to_char(hiredate,'YYYYMMDD'),5,2) ='04';


--3. MOD 함수를 사용하여 직속상관이 홀수인 사원만 출력하시오. 
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
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉, mod(manager,2)
FROM
    employee
where mod(nvl(manager,0),2) >0;

--4. MOD 함수를 사용하여 월급이 3의 배수인 사원들만 출력하세요.
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
    nvl(salary, 0) * 12 + nvl(commission, 0) 연봉 , mod(nvl(salary,0),3)
FROM
    employee
where salary is not null
and mod(nvl(salary,0),3) =0; 

--5. 입사한 년도는 2자리 (YY), 월은 (MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력 하시오. 
SELECT
    eno                                      사원번호,
    ename                                    사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    to_char(hiredate,'YY') YY, to_char(hiredate,'MM') MON, to_char(hiredate,'DD') DY
FROM
    employee;

--6. 올해 몇 일이 지났는지 출력 하시오. 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여
--   데이터 형식을 일치 시키시오.
SELECT
       MONTHS_BETWEEN(sysdate , to_date('20230101') )
     , sysdate - to_date('20230101' )
FROM
    dual;
 
--7. 자신이 태어난 날짜에서 현재까지 몇 일이 지났는지 출력 하세요. 
select sysdate - to_date('19780807') 
from dual;
--8. 자신이 태어난 날짜에서 현재까지 몇 개월이 지났는지 출력 하세요.
select MONTHS_BETWEEN(sysdate , to_date('19780807') )
from dual;

--9. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 null 갑대신 0으로 출력 하시오.
--10.   사원번호,
--      [사원번호 2자리만출력 나머지는 *가림 ] as "가린번호", 
--      이름, 
--       [이름의 첫자만 출력 총 네자리, 세자리는 * 가림] as "가린이름"       
SELECT
    RPAD(substr(eno,1,2),length(eno-2),'*')   사원번호, 
    RPAD(substr(ename,1,1),lengthb(ename)-1,'*') 사원명,
    job                                      직책,
    manager                                  직속상관,
    hiredate                                 입사일자,
    salary                                   월급,
    commission                               보너스,
    nvl(commission, 0)                       보너스1,
    dno                                      부서번호,
    nvl(manager,0)
FROM
    employee;

--11.  주민번호:   를 출력하되 801210-1*******   출력 하도록 , 전화 번호 : 010-12*******
--	dual 테이블 사용
select '8012101111111'
,      substr('8012101111111',1,6) || '-' || substr('8012101111111',7,1) || '*******'
,  lpad(6 , '*')

from dual;


--12 자신의 생일에서 현재까지 몇개월 살았는지 ?  몇일 살았는지 출력   <== months_between ( 현재날짜, 생일)  : 개월수 
--        -- sysdate - 생일 (date) 
select MONTHS_BETWEEN(sysdate , to_date('19780807') )
from dual;       
--13.  employee 테이블에서 2050년 12월 24 일까지의 날짜(일수)  를 출력 
select        trunc(TO_DATE('2050-12-24', 'YYYY-MM-DD') - SYSDATE )
from dual;