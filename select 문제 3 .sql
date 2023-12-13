--1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
SELECT
hiredate,
    substr(to_char(hiredate,'YYYYMMDD'),1,4)   �⵵
    , substr(to_char(hiredate,'YYYYMMDD'),5,2) ��
FROM
    employee
;



--2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
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
where substr(to_char(hiredate,'YYYYMMDD'),5,2) ='04';


--3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
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
    nvl(salary, 0) * 12 + nvl(commission, 0) ����, mod(manager,2)
FROM
    employee
where mod(nvl(manager,0),2) >0;

--4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
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
    nvl(salary, 0) * 12 + nvl(commission, 0) ���� , mod(nvl(salary,0),3)
FROM
    employee
where salary is not null
and mod(nvl(salary,0),3) =0; 

--5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
SELECT
    eno                                      �����ȣ,
    ename                                    �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    to_char(hiredate,'YY') YY, to_char(hiredate,'MM') MON, to_char(hiredate,'DD') DY
FROM
    employee;

--6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
--   ������ ������ ��ġ ��Ű�ÿ�.
SELECT
       MONTHS_BETWEEN(sysdate , to_date('20230101') )
     , sysdate - to_date('20230101' )
FROM
    dual;
 
--7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select sysdate - to_date('19780807') 
from dual;
--8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
select MONTHS_BETWEEN(sysdate , to_date('19780807') )
from dual;

--9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
--10.   �����ȣ,
--      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
--      �̸�, 
--       [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�"       
SELECT
    RPAD(substr(eno,1,2),length(eno-2),'*')   �����ȣ, 
    RPAD(substr(ename,1,1),lengthb(ename)-1,'*') �����,
    job                                      ��å,
    manager                                  ���ӻ��,
    hiredate                                 �Ի�����,
    salary                                   ����,
    commission                               ���ʽ�,
    nvl(commission, 0)                       ���ʽ�1,
    dno                                      �μ���ȣ,
    nvl(manager,0)
FROM
    employee;

--11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
--	dual ���̺� ���
select '8012101111111'
,      substr('8012101111111',1,6) || '-' || substr('8012101111111',7,1) || '*******'
,  lpad(6 , '*')

from dual;


--12 �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
--        -- sysdate - ���� (date) 
select MONTHS_BETWEEN(sysdate , to_date('19780807') )
from dual;       
--13.  employee ���̺��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ��� 
select        trunc(TO_DATE('2050-12-24', 'YYYY-MM-DD') - SYSDATE )
from dual;