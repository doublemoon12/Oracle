-- 그룹함수 문제

SELECT
    *
FROM employee;

-- 1.
SELECT max(salary)최고액, min(salary)최저액, sum(salary)총액, trunc(avg(salary))평균
from employee;

-- 2.
SELECT job, max(salary)최고액, min(salary)최저액, sum(salary)총액, trunc(avg(salary))평균
from employee
group by job;

-- 3.
select job, count(job)
from employee
group by job;

-- 4.
select manager, COUNT(manager)관리자수
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
select dno 부서번호, count(dno)사원수, round(avg(salary), 2)평균급여
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
        count(dno)"Number of People", trunc(avg(salary))Salary
from employee
group by dno;
