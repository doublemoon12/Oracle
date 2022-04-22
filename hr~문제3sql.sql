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

select *
from employee;

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
where (e.hiredate = m.hiredate) and e.hiredate(e.ename = 'WARD') > e.hiredate;

select e.ename �̸�, e.hiredate, m.hiredate
from employee e, employee m
where e.hiredate = m.hiredate;

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
select job, ename
from employee 
group by job
having job = (select job from employee)

