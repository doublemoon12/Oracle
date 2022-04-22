-- 문제 3

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
-- JOIN에서 USING을 사용하는 경우 :
    -- NATURAL JOIN : 공통 키 컬럼을 Oracle 내부에서 자동 처리
        -- 반드시 두 테이블의 공통키 컬럼의 데이터 타입이 같아야한다.
    -- 두 테이블의 공통 키 컬럼의 데이터 타입이 다른경우 USING을 사용한다.
    -- 두 테이블의 공통 키 컬럼이 여러개인 경우 USING 사용.

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
select e.ename 이름, e.dno 부서번호, m.ename 동료
from employee e, employee m
where (e.dno = m.dno) and e.ename = 'SCOTT';

-- 10.
select e.ename 이름, e.hiredate
from employee e, employee m
where (e.hiredate = m.hiredate) and e.hiredate(e.ename = 'WARD') > e.hiredate;

select e.ename 이름, e.hiredate, m.hiredate
from employee e, employee m
where e.hiredate = m.hiredate;

select ename, hiredate
from employee
where hiredate > (select hiredate from employee where ename = 'WARD');

-- 11.
select e.ename 사원이름, e.hiredate 입사날짜, m.ename 매니저이름, m.hiredate 매니저입사날짜
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

