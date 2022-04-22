-- �׷��Լ� ����

SELECT
    *
FROM employee;

-- 1.
SELECT max(salary)�ְ��, min(salary)������, sum(salary)�Ѿ�, round(avg(salary))���
from employee;

-- 2.
SELECT job, max(salary)�ְ��, min(salary)������, sum(salary)�Ѿ�, round(avg(salary))���
from employee
group by job;

-- 2-1.
SELECT job, max(salary)�ְ��, min(salary)������, sum(salary)�Ѿ�, round(avg(salary))���
from employee
group by rollup(job);

SELECT job, max(salary)�ְ��, min(salary)������, sum(salary)�Ѿ�, round(avg(salary))���
from employee
group by cube(job)
order by job;

-- 2-2 �ΰ� �̻��� �÷��� �׷���
SELECT dno, job,count(*) , max(salary)�ְ��, min(salary)������, sum(salary)�Ѿ�, round(avg(salary))���
from employee
group by dno, job
order by dno asc;

SELECT dno, job,count(*) , max(salary)�ְ��, min(salary)������, sum(salary)�Ѿ�, round(avg(salary))���
from employee
group by rollup(dno, job);

SELECT dno, job,count(*) , max(salary)�ְ��, min(salary)������, sum(salary)�Ѿ�, round(avg(salary))���
from employee
group by cube(dno, job)
order by dno;

-- 3.
select count(distinct job)from employee;

select job, count(job)
from employee
group by job;

-- 4.
select manager, COUNT(manager)�����ڼ�
from employee
group by manager;

-- 5.
select (max(salary) - MIN(salary))DIFFERENCE
from employee;

-- 6.
select job, min(salary)
from employee
where manager is not null
group by job
having not min(salary) < 2000
order by min(salary) desc;

-- 7.
select dno �μ���ȣ, count(dno)�����, round(avg(salary), 2)��ձ޿�
from employee
group by dno;

-- 8.
select decode(dno, 10, 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                    'DEFAULT') as DNAME,
        decode(dno, 10, 'NEW YORK',
                    20, 'DALLS',
                    30, 'CHICAO',
                      'DEFAULT') as Location,
        count(dno)"Number of People", round(avg(salary))Salary
from employee
group by dno;
