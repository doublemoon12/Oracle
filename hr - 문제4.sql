-- �п� ����
select ename ����̸�, salary ����
from employee
where salary not BETWEEN 1000 and 1500;

select ename ����̸�, hiredate �Ի���
from employee
where hiredate like '81%';

select *
from employee
where (substr(hiredate, 1, 2)) = 87;

select round(MONTHS_BETWEEN(SYSDATE,hiredate)) ������
from employee;

select dno, sum(salary)
from employee
group by dno
having SUM(salary) > 3000;

select dno �μ���ȣ, count(dno) �μ��������, round(avg(salary), 2)��ձ޿�
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







