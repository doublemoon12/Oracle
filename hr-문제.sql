-- dno�� 10�� �μ��� ��� ���޿��� + 300, 20�� �μ��� ��� + 500, 30�� �μ��� ��� + 700
-- �̸�, ����, �μ��� +�� ������ ���
select * from employee;

select ename, salary, dno, decode(dno, 10, salary + 300,
                                  20, salary + 500,
                                  30, salary + 700) as "+����"
from employee
ORDER BY dno asc;

select *
from employee;

-- 1.
select ename, substr(hiredate, 0, 5)
from employee;

-- 2.
select ename, hiredate
from employee
where substr(hiredate, 4, 2) = '04';

-- 3.
select ename, manager
from employee
where mod(manager, 2) = 1;

-- 3-1.
select ename, salary
from employee
where mod(salary, 3) = 0;

-- 4.
select ename, to_char(hiredate, 'YY/MON, DY')
from employee;

-- 5.
select  trunc(sysdate - to_date('2022/01/01', 'YYYY/MM/DD')) as "���� ����"
from dual;

-- 5-1.
select  trunc(sysdate - to_date('1995/11/23', 'YYYY/MM/DD')) as ����
from dual;

-- 5-2.
select  trunc(MONTHS_BETWEEN(SYSDATE, to_date('1995/11/23', 'YYYY/MM/DD'))) as ���
from dual;

-- 6.
select ename, nvl(manager, 0) ���
from employee;

--7. 
select ename, job, decode(job, 'ANALYST', salary + 200,
                              'SALESMAN', salary + 180,
                              'MANAGER', salary + 150,
                              'CLERK', salary + 100,
                              salary) as "�λ�� �޿�"
from employee
order by job;

-- 8.
select rpad(rpad(eno, 2), 4, '*') as ������ȣ, rpad(rpad(ename, 1), 3, '*') as �����̸�
from employee;

-- 9.
SELECT rpad(rpad('951123-1111111', 8), 14, '*'), rpad(rpad('010-1111-1111', 6), 13, '*')
from dual;

-- 10.
select eno, ename, manager, case when manager like '75%' then 5555
                                when manager like '76%' then 6666
                                when manager like '77%' then 7777
                                when manager like '78%' then 8888
                                when manager is null then 0000
                                else manager
                            END as ��ȣ
from employee;
