select INITCAP('abc') from dual;

select *
FROM
    employee
where    LOWER(ENAME) = 'smith';
    
select *
FROM
    employee
where    ENAME = upper('smith');
        
select LPAD(job, 10,'*')
FROM
    employee;        
    
select CONCAT('ab','cde') from dual;    

selecT ename || ' ' || job 
FROM     employee;

select hiredate, ename, to_char(hiredate,'YYYY') 입사년도, to_char(hiredate,'MM') 입사월, to_char(hiredate, 'DD') 입사일
FROM     employee
where hiredate like '81%';


select (INSTR('Oracle Minia','a',4))
from dual;


select hiredate, RPAD(substr(hiredate, 1,2),6,'*'), to_char(1234,'B9999.99')
FROM     employee;

select  to_char(1234,'B9999,999') 
,       to_char(1234,'$9999') 
,       to_date('1998-10-10','YYYY-MM-DD')
,       to_char(sysdate-100,'yyyymmdd')
,       to_char(sysdate+100,'yyyymmdd')
,       MONTHS_BETWEEN(sysdate , to_date('19780807') )
,       TO_DATE('2050-12-24', 'YYYY-MM-DD') - SYSDATE 
from dual;

select salary , salary *0.033, round(salary *0.033,2)
,trunc(salary *0.033,2)
FROM     employee; 


SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('780807', 'YYMMDD')) AS months_lived
FROM DUAL;
