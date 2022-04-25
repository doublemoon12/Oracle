-- 학원 문제
select ename 사원이름, salary 월급
from employee
where salary not BETWEEN 1000 and 1500;

select ename 사원이름, hiredate 입사일
from employee
where hiredate like '81%';

select *
from employee
where (substr(hiredate, 1, 2)) = 87;

select round(MONTHS_BETWEEN(SYSDATE,hiredate)) 개월수
from employee;

select dno, sum(salary)
from employee
group by dno
having SUM(salary) > 3000;

select dno 부서번호, count(dno) 부서별사원수, round(avg(salary), 2)평균급여
from employee
GROUP by dno;

select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno and e.ename = 'SCOTT';

SELECT ename, dname, loc
FROM employee e NATURAL join department d
where commission is not null and commission != 0;

select ename, salary, dno
from employee
where salary in (select min(salary) from employee group by dno)







