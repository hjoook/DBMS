

--1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    salary +300                                  �λ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee;
    
--2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
 --  ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + 100                ����
FROM
    employee
    order by (nvl(salary, 0) * 12 + 100 )  desc ;
   
--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM
    employee
where salary >2000    
order by salary desc    ;
    
--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM
    employee
where eno = 7788    
    ;
--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM
    employee
where salary < 2000  or   salary >3000
;
--6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM
    employee
where to_char(hiredate,'YYYYMMDD') between '19810220' and '19810501';

--7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM
    employee
where dno between 20 and 30
order by ename
;

--8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM
    employee
where salary between 2000 and 3000
and dno between 20 and 30
order by ename desc
;
--9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM employee
 where   hiredate like '81_%';
 


--10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM employee
 where manager is null;

--11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM employee
 where commission >0
 order by commission;

--12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM employee
 where substr(ename, 3,1) ='R'; 

--13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM employee
 where INSTR(ename, 'A')  != 0
 and   INSTR(ename, 'E')  != 0;

--14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
--   �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ 
FROM employee
 where job in ('CLERK','SALESMAN')
 and  salary not  in (950,1600,1300)
 ;

--15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,    
    commission                               ���ʽ�,
    nvl(commission,  0)                       ���ʽ�1,
    salary + nvl(commission, 0)              ����,  
    dno                                      �μ���ȣ    
FROM employee
 where  nvl(commission, 0) >=500
