/*

1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
    ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
      
      // �Ϸ�ð� : 15: 30 �б��� .
      
*/ 

-- <<���� Ǯ�� ����>>
1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
desc employee; 

select * 
from employee; 

select eno as �����ȣ, ename �����, job ��å, manager "���ӻ��  ID",
    hiredate �Ի糯¥, salary ����, commission ���ʽ�, dno �μ���ȣ
from employee; 

select ename, salary, salary + 300 as �λ�ȱ޿�
from employee; 

2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
    ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
    
    -- ����� DataBase ���� ��� ���̺� ��� 
    select * from tab; 
    
    select ename, salary, commission from employee; 
    
    select ename, salary,commission,salary *12, salary *12 + NVL(commission,0) + 100 as �ѿ���
    from employee
    order by salary *12 + NVL(commission,0) + 100 desc; 
    
    
     
3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 

desc employee;

select ename, salary    -- �÷���
from employee           -- ���̺�, ��
where salary >= 2000    -- ����
order by salary desc    -- ���� 



4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
select ename, dno ,eno
from employee
where eno = 7788

5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
select ename, salary 
from employee
where salary not between 2000 and 3000; 

6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�

select ename, job, hiredate
from employee
where hiredate between '1981/2/20' and '1981/5/1'; 

7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
select ename, dno 
from employee
where dno = 20 or dno = 30 
order by ename desc; 

select ename, dno 
from employee
where dno in ( 20, 30 )
order by ename desc; 

8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
select ename, salary, dno 
from employee
where (salary between 2000 and 3000) and (dno in (20,30)) 

9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ���: _ , %)
select ename, hiredate 
from employee 
where hiredate like '81%';

select ename, hiredate 
from employee 
where substr (hiredate , 1,2) = '81' ;


10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
select * from employee; 

select ename, manager
from employee
where manager is null ; 


11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿��� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�. 
select * from employee
order by commission desc; 

select ename, salary, commission 
from employee
where commission is not null
order by salary desc, commission desc

12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
select ename 
from employee
where ename like '__R%'      

select ename
from employee
where instr(ename, 'R', 3)=3;

select ename , instr(ename, 'R', 3) from employee; 


13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename 
from employee
where ename like '%A%' and ename like '%E%'

select ename 
from employee
where instr(ename, 'A')!=0 and instr(ename, 'E')!=0;

select ename , instr (ename, 'A') , instr(ename , 'E') from employee; 

14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.

select ename, job, salary 
from employee
where (job = 'CLERK' or job = 'SALESMAN') and  salary not in ( 1600, 950, 1300) 

select ename , job , salary 
from employee
where job in ('CLERK', 'SALESMAN') and salary not in (1600,950,1300);
    
15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
select ename, salary ,commission
from employee
where commission >= 500; 

-- <<����Ǯ�� �Ϸ�>>