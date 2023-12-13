

--<����1>  commission(���ʽ�) �÷��� null �� ���� ����ϵ� �����ȣ, ����̸�,�Ի糯¥�� ��� 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    hiredate                                 �Ի�����,
    commission
FROM
    employee
where commission is null	
;


--<����2> dno(�μ���ȣ) �� 20�̰� �Ի糯¥�� 81�� 4�� ���� ����� �̸��� ��å�� �Ի糯¥�� ���
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee;
where dno =20 
and   hiredate >= '19810401';

--<����3> ������ ����ؼ� �����ȣ, ����̸�, ����, ���ʽ�, ��ü ������ ���
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
    order by 5 desc;


--<����4> commission�� null �� �ƴ� ������� �̸��� ��� 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where commission is not null;

-- <����5> manager (���޻��) 7698 �� ����̸��� ��å�� ���.
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where manager= 7698
;

--<����6> ������ 1500 �̻��̰� �μ��� 20�� ����� ����̸��� �Ի糯¥, �μ���ȣ, ������ ���
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where salary >= 1500
 and  dno =20
;

--<����7> �Ի糯¥�� 81�� 4�� 1�� �̻��̰� 81�� 12�� ���ϱ����� ��� �̸��� �Ի糯¥�� ���
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where   to_char(hiredate,'YYYYMMDD') between '19810401' and '19811231'; 


--<����8> ��å(job) salesman �̸鼭 ������ 1500 �̻��̸鼭 �μ���ȣ�� 30�� ������� ���
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where  job = 'salesman'
and  (nvl(salary, 0) * 12 + nvl(commission, 0) )  > =1500
and dno =30;

--<����9> ������ 1500 �����̸鼭 �μ���ȣ�� 20�� �� �ƴ� ����̸���, ���ް�, �μ���ȣ�� ���
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where  dno != 20
and  salary  <= 1500;

--<����10> �����ȣ(eno) �� 7788, 7782 �� �μ���ȣ�� �̸��� ��å�� ��� 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where  eno in (7788, 7782 );

--<����11> ������ [SALESMAN]�� �ƴ� ����� �����ȣ,����̸�,����,�޿� �˻�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where  job <> 'SALESMAN'
;

--<����12> �޿��� [2000]�̻��� ����� �����ȣ,����̸�,����,�޿� �˻�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where  salary >= 2000
;

--<����13> ����̸��� [A],[B],[C]�� ���۵Ǵ� ����� �����ȣ,����̸�,����,�޿� �˻�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where  substr(ename,1,1) in ('A','B','C');
;

--<����14> [1981�� 5�� 1��]������ �Ի��� ����� �����ȣ,����̸�,����,�޿�,�Ի��� �˻�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where   hiredate < '810501';
;

--<����15> ������ [SALESMAN]�� ��� �� �޿��� [1500]�̻��� ����� �����ȣ,����̸�,����,�޿� �˻�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where   job <= 'SALESMAN'
and   salary >=1500;

--<����16> �μ���ȣ�� [10]�̰ų� ������ [MANAGER]�� ����� �����ȣ,����̸�,����,�޿�,�μ���ȣ �˻�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
FROM
    employee
where   dno = '10'
or   job ='MANAGER';

--<����17> �޿��� [1000~3000]�� ����� �����ȣ,����̸�,����,�޿� �˻�
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(salary, 0) * 12 + nvl(commission, 0) ����
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