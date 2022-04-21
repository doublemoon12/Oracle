-- ¹®Á¦ 3

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
SELECT job, loc
FROM employee e join department d
using (dno)
where dno = 10;

-- 4.
SELECT ename, dno, loc
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