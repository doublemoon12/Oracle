-- dno가 10번 부서인 경우 월급에서 + 300, 20번 부서일 경우 + 500, 30번 부서일 경우 + 700
-- 이름, 월급, 부서별 +한 월급을 출력
select * from employee;

select ename, salary, dno, decode(dno, 10, salary + 300,
                                  20, salary + 500,
                                  30, salary + 700) as "+월급"
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
select  trunc(sysdate - to_date('2022/01/01', 'YYYY/MM/DD')) as "올해 몇일"
from dual;

-- 5-1.
select  trunc(sysdate - to_date('1995/11/23', 'YYYY/MM/DD')) as 몇일
from dual;

-- 5-2.
select  trunc(MONTHS_BETWEEN(SYSDATE, to_date('1995/11/23', 'YYYY/MM/DD'))) as 몇달
from dual;

-- 6.
select ename, nvl(manager, 0) 상관
from employee;

--7. 
select ename, job, decode(job, 'ANALYST', salary + 200,
                              'SALESMAN', salary + 180,
                              'MANAGER', salary + 150,
                              'CLERK', salary + 100,
                              salary) as "인상된 급여"
from employee
order by job;

-- 8.
select rpad(rpad(eno, 2), 4, '*') as 가린번호, rpad(rpad(ename, 1), 3, '*') as 가린이름
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
                            END as 번호
from employee;
