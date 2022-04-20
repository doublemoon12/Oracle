desc department;

select * from employee;

select eno 사원번호, ename 사원명, job 직책, manager "직속상관 ID",
    hiredate 입사날짜, salary 월급, commission 보너스, dno 부서번호
from employee;

-- 1.
select ename, salary,
salary + 300 "인상된 급여"
from employee;

-- 2.
select ename, salary, commission,
salary * 12 + nvl(commission, 0) + 100 총연봉
from employee
order by salary * 12 + nvl(commission, 0) + 100 DESC;

-- 3.
select ename, salary
from employee
where salary > 2000
order by salary DESC;

-- 4.
select ename, dno
from employee
where eno = 7788;

-- 5.
select ename, salary
from employee
where salary not BETWEEN 2000 and 3000;

-- 6.
select ename, job, hiredate
from employee
where hiredate BETWEEN '81/2/20' and '81.05.01';

-- 7.
select ename, dno
from employee
where dno in (20, 30)
order by ename desc;

-- 8.
select ename, salary ,dno
from employee
where (salary BETWEEN 2000 and 3000) and (dno in (20, 30))
order by ename;

-- 9.
select ename, hiredate
from employee
where hiredate like '81%';

-- 10.
select ename, job
from employee
where manager is null;

-- 11.
select ename, salary, commission
from employee
where commission is not null
order by salary desc, commission DESC;

-- 12.
select ename
from employee
where ename like '__R%';

-- 13.
select ename
from employee
where ename like '%A%E%' or ename like '%E%A%';

select ename
from employee
where ename like '%A%' and ename like '%E%';

-- 14.
select ename, job ,salary
from employee
where (job in ('CLERK', 'SALESMAN')) and (salary not in (1600, 950, 1300));

-- 15.
select ename, salary, commission
from employee
where commission >= 500;

