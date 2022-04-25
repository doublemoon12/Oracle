-- ���� 3

-- 1.
SELECT e.dno, dname
FROM employee e, department d
where e.dno = d.dno
and e.ename = 'SCOTT';

-- 2.
SELECT ename, dname, loc
FROM employee e join department d
on e.dno = d.dno;

-- 3.
-- JOIN���� USING�� ����ϴ� ��� :
    -- NATURAL JOIN : ���� Ű �÷��� Oracle ���ο��� �ڵ� ó��
        -- �ݵ�� �� ���̺��� ����Ű �÷��� ������ Ÿ���� ���ƾ��Ѵ�.
    -- �� ���̺��� ���� Ű �÷��� ������ Ÿ���� �ٸ���� USING�� ����Ѵ�.
    -- �� ���̺��� ���� Ű �÷��� �������� ��� USING ���.

SELECT job, loc
FROM employee e join department d
using (dno)
where dno = 10;

-- 4.
SELECT ename, dno, loc, commission
FROM employee e natural join department d
where commission is not null and commission != 0;

-- 5.
SELECT e.ename ,e.dno
FROM employee e, department d
where e.dno = d.dno
and ename like '%A%';

-- 6.
SELECT ename, job , dno, dname
FROM employee e natural join department d
where loc = 'NEW YORK';

-- 7.
select e.eno, e.ename, m.ename, m.eno
from employee e, employee m
where e.manager = m.eno;


-- 8.
select *
from employee e, employee m
where e.manager = m.eno(+)
order by e.eno desc;

-- 9.
select e.ename �̸�, e.dno �μ���ȣ, m.ename ����
from employee e, employee m
where (e.dno = m.dno) and e.ename = 'SCOTT';

-- 10.
select e.ename �̸�, e.hiredate
from employee e, employee m
where m.ename = 'WARD' and e.hiredate > m.hiredate;

select ename, hiredate
from employee
where hiredate > (select hiredate from employee where ename = 'WARD');

-- 11.
select e.ename ����̸�, e.hiredate �Ի糯¥, m.ename �Ŵ����̸�, m.hiredate �Ŵ����Ի糯¥
from employee e, employee m
where e.manager = m.eno and e.hiredate < m.hiredate;

-- 1.
select ename, job
from employee
where job = (select job from employee where eno = 7788);

-- 2.
select ename, job
from employee
where salary > (select salary from employee where eno = 7499);

-- 3.
select job, ename, salary
from employee
where salary in(select min(salary) from employee group by job);

-- 4.
select job, min(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary)) from employee group by job);

select job, min(salary)
from employee
group by job
having avg(salary) <= all(select avg(salary) from employee group by job);

select ename, job, salary
from employee
where salary = (select min(salary) from employee GROUP BY job having avg(salary) = (select min(avg(salary)) from employee group by job));

-- 5.
select ename, salary, dno
from employee
where salary in (select min(salary) from employee group by dno);

-- 6.
select eno, ename, job, salary
from employee
where salary < any(select salary from employee where job = 'ANALYST') and job <> 'ANALYST';

-- 7.
select ename
from employee
where eno not in (select distinct manager from employee where manager is not null);

-- 8.
select ename
from employee
where eno in (select distinct manager from employee);

-- 9.
select ename, hiredate
from employee
where dno = (select dno from employee where ename = 'BLAKE') and ename <> 'BLAKE';

-- 10.
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee)
order by salary;

-- 11.
select eno, ename
from employee
where dno in (select dno from employee where ename like '%K%');

-- 12.
select ename, dno, job
from employee 
where dno = (select dno from department where loc = 'DALLAS');

select e.ename, e.dno, e.job, d.loc
from employee e, department d
where e.dno = d.dno
and d.loc = 'DALLAS';

-- 13.
select ename, salary
from employee
where manager = (select eno from employee where ename = 'KING');

-- 14.
select dno, ename, job
from employee
where dno = (select dno from department where dname = 'RESEARCH');

select e.ename, eno, e.job, d.dname
from employee e, department d
where e.dno = d.dno
and d.dname = 'RESEARCH';

-- 15.
select eno, ename, salary
from employee
where (salary > (select avg(salary) from employee)) and dno in (select dno from employee where ename like '%M%');

select eno, ename, salary
from employee
where dno in (select dno from employee where (ename like '%M%') and (salary > (select avg(salary) from employee)));

-- 16.
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary)) from employee group by job);

-- 17. 
select *
from employee
where dno in (select dno from employee where job = 'MANAGER');

select *
from employee
order by dno;










