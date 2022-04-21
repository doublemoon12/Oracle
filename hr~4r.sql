-- 4����
/*
    �׷� �Լ� : ������ ���� ���ؼ� �׷����ؼ� ó���ϴ� �Լ�
        group by ���� Ư�� �÷��� ���� �� ���, �ش� �÷��� ������ ������ �׷��� �ؼ� ������ ����.
    ���� �Լ�: 
    - SUM   : �׷��� �հ�
    - AVG   : �׷��� ���
    - MAX   : �׷��� �ִ밪
    - MIN   : �׷��� �ּҰ�
    - COUNT : �׷��� �� ����(���ڵ� �� record, �ο�� ,row)
*/
    
select sum (salary), avg (salary), max(salary), min(salary)
from employee;

-- ���� : ���� �Լ��� ó�� �Ҷ�, ��� �÷��� ���� ������ ������ �÷��� ����

select sum (salary)
from employee;

select ename
from employee;

-- �����Լ��� null ���� ó���ؼ� �����Ѵ�.
select sum (commission), avg(commission), max(commission), min(commission)
from employee;

-- count()  : ���ڵ� ��, �ο� ��
    -- null�� ó������ �ʴ´�.
    -- ���̺��� ��ü ���ڵ� ���� ������ ��� : count(*) �Ǵ� NOT NULL �÷��� count()
    
desc employee;

select eno from employee;
select count (eno) from employee;

select commission from employee;
select count (commission) from employee;

select count(*) from employee;
select * from employee;

-- ��ü ���ڵ� ī��Ʈ
select count(*) from employee;
select count(eno) from employee;

-- �ߺ����� �ʴ� ������ ����
select job from employee;

select count(distinct job) from employee;

-- �μ��� ����

select count (distinct dno) from employee;

-- Group by : Ư�� �÷��� ���� �׷��� �Ѵ�. �ַ� �����Լ��� select ������ ���� ����մϴ�.
/*
    select �÷���, �����Լ�ó���� �÷�
    from ���̺�
    where ����
    group by �÷���
    having ���� (group by�� ����� ����)
    order by (����)
*/

select dno as �μ���ȣ, avg(salary) as ��ձ޿�
from employee
group by dno;       -- dno �÷��� �ߺ��Ȱ��� �׷��� ��.

select dno from employee order by dno;

--��ü ��� �޿�.
select avg(salary) as ��ձ޿�
from employee;

-- group by�� ����ϸ鼭 select ���� ������ �÷��� �� �����ؾ� �Ѵ�.
select dno,count(dno), sum(salary), avg(salary), max(commission), min(commission)
from employee
group by dno;

select job from employee;

-- ������ ��å�� �׷����ؼ� ������ ���, �հ�, �ִ�, �ּڰ� ���

select job, count(job), avg(salary) ���, sum(salary) ���Ѱ�, max(salary)�ִ밪, min(salary)�ּҰ�
from employee
group by job; -- ������ ��å�� �׷����ؼ� ���踦 �Ѵ�.

-- ���� �÷��� �׷��� �ϱ�.
select dno, job, count(*), sum(salary)
from employee
group by dno, job;

select dno, job
from employee
where dno = 20 and job = 'CLERK';

-- having : group by���� ���� ����� �������� ó�� �Ҷ�.
    -- ��Ī�̸��� �������� ��� �Ұ�
    
select dno, count(*), sum(salary) "�μ��� �հ�", round(avg(salary), 2) as"�μ��� ���"
from employee
group by dno
having sum(salary) > 9000;

-- �μ��� ������ ����� 2000�̻� ���.
select dno, count(*), sum(salary) "�μ��� �հ�", round(avg(salary), 2) as"�μ��� ���"
from employee
group by dno
having avg(salary) > 2000;

-- where �� having ���� ���� ���Ǵ� ���
    -- where    : ���� ���̺��� �������� �˻�
    -- having   : group by ����� ���ؼ� ������ ó��.
    
-- ������ 1500���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ����� 2000�̻��� �͸� ��� �϶�.
select dno, count(*), round(avg(salary))
from employee
where salary > 1500
group by dno
having round(avg(salary)) > 2500;

-- ROLLUP
-- CUBE
    -- GROUP BY������ ����ϴ� Ư���� �Լ�
    -- ���� �÷��� ���� �� �� �ִ�.
    -- group by���� �ڼ��� ������ ���...

-- ROLLUP, cube�� ������� �ʴ� ���
select dno,count(*) , sum(salary), round(avg(salary))
from employee
group by dno
order by dno;

-- ROLLUP : �μ��� �հ�� ����� ���, ������ ���ο� ��ü �հ�, ��� ���
select dno,count(*) , sum(salary), round(avg(salary))
from employee
group by rollup(dno)
order by dno;

-- cube : �μ��� �հ�� ����� �����, ������ ���ο� ��ü �հ�, ���
select dno,count(*) , sum(salary), round(avg(salary))
from employee
group by cube(dno)
order by dno;

-- Rollup : �� �÷��̻�
select dno, job, count(*), max(salary), sum(salary), round(avg(salary))
from employee
group by rollup(dno, job); -- �ΰ��� �÷��� �����, �� �÷��� ���ļ� �����Ҷ� �׷���.

select dno, job, count(*), max(salary), sum(salary), round(avg(salary))
from employee
group by dno,job
order by dno;

-- cube
select dno, job, count(*), max(salary), sum(salary), round(avg(salary))
from employee
group by cube(dno, job)
order by dno, job;

-- join : ���� ���̺��� ���ļ� �� ���̺��� �÷��� �����´�.
    -- department�� employee�� ���� �ϳ��� ���̺��� ������ �𵨸�(�ߺ�����, �������)�� ���ؼ� �� ���̺��� �и�
    -- �� ���̺��� ����Ű �÷�(dno), employee ���̺��� dno �÷��� department ���̺��� dno�÷��� ����.
    -- �ΰ� �̻��� ���̺��� �÷��� join������ ����ؼ� ���.
select * from department;
select * from employee;

-- EQUI join : ����Ŭ���� ���� ���� ����ϴ� join, oracle������ ����
    -- from��    : join�� ���̺��� ,�� ó��
    -- where��   : �� ���̺��� ������ Ű �÷��� " = " �� ó��
    -- and��     : ������ ó��
    -- and �� : �����̺��� ������ Ű �÷��� " = " �� ó��
    -- on �� : �� ���̺��� ������ Ű �÷��� " = " �� ó��
        -- where �� : ������ ó��

-- where �� : ���� Ű �÷��� ó���� ���

select *
from employee e, department d
where e.dno = d.dno
and job = 'MANAGER';

-- ANSI ȣȯ : INNER JOIN
-- on �� : ���� Ű �÷��� ó���� ���

select *
from employee e INNER join department d
on e.dno = d.dno
where job = 'MANAGER';

select *
from employee, department
where department.dno = employee.dno
and job = 'MANAGER';

-- JOIN�� ���̺� �˸�� (���̺� �̸��� ��Ī���� �ΰ� ���� ���)
select *
from employee e, department d
where e.dno = d.dno
and salary > 1500;

-- select ������ ���� Ű �÷��� ��½ÿ� ��� ���̺��� �÷����� ��� : dno

select eno, job, dname, d.dno
from employee e, department d
where e.dno = d.dno;

-- �� ���̺��� join�ؼ� ����(salary)�� �ִ밪�� �μ���(dname)���� ���

select dname, count(*), max(salary)
from employee e, department d
where e.dno = d.dno
group by dname;

-- NATURAL JOIN : Oracle 9i ����
    -- EQUI JOIN�� Where���� ���� : �� ���̺��� ������ Ű �÷��� ���� " = "
    -- ������ Ű �÷��� Oracl ���������� �ڵ����� �����ؼ� ó��.
    -- ���� Ű �÷��� ��Ī �̸��� ����ϸ� ������ �߻�.
    -- �ݵ�� ���� Ű �÷��� ������ Ÿ���� ���ƾ� �Ѵ�.
   -- from���� natural join Ű���带 ���.
    
select eno, ename, dname, dno
from employee e natural join department d;

-- ���� : select ���� ����Ű �÷��� ��� ���̺���� ����ϸ� ���� �߻�

-- EQUI JOIN vs NATURAL JOIN �� ���� Ű �÷� ó��
    -- EQUI JOIN : select���� �ݵ�� ���� Ű �÷��� ��� �Ҷ� ���̺�� �ݵ�� ���.
    -- NATURAL JOIN : select���� �ݵ�� ���� Ű �÷��� ��� �Ҷ� ���̺�� �ݵ�� ������� �ʾƾ� �Ѵ�.
        

select ename, salary, dname, e.dno
from employee e, department d
where e.dno = d.dno
and salary > 2000;

select ename, salary, dname, dno
from employee e natural join department d
where salary > 2000;

select ename, salary, dname, e.dno
from employee e join department d
on e.dno = d.dno
where salary > 2000;

-- NON EQUI JOIN : EQUI JOIN���� Where���� " = " �� ������� �ʴ� JOIN

select * from salgrade; -- : �������� ����� ǥ���ϴ� ���̺�

select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

-- ���̺� 3�� ����
select ename, dname, salary, grade
from employee e, department d, salgrade s
where e.dno = d.dno
and salary BETWEEN losal and hisal;
