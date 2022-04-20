
    

desc department;

/*
Select ������ ��ü �ʵ� ����

Select      <== �÷���
Distinct    <== �ķ����� ���� �ߺ��� �����ض�.
From        <== ���̺��, ���
Where       <== ����
Group By    <== Ư������ �׷���
Having      <== �׷����� ���� ����
Order by    <== ���� �����ؼ� ���


*/

SELECT
    *
FROM employee;

-- Ư�� �÷��� ���
select eno, ename from employee;

-- �÷��� ������ ���� �� �� �ִ�
select eno, ename, salary, salary * 12 from employee;

-- �÷��� �˸��(Alias) : �÷��� �̸��� ����,
    -- �÷��� ������ �ϰų� �Լ��� ����ϸ� �÷����� ��������.
select eno as �����ȣ, ename as �����, salary as ����, salary * 12 as ���� from employee;
select eno �����ȣ, ename �����, salary ����, salary * 12 ���� from employee;
    -- �����̳� Ư�����ڰ� ��� ������ ""���� ó���ؾ� �Ѵ�.
    select eno "��� ��ȣ", ename "��#����", salary ����, salary * 12 ���� from employee;
    
-- nvl �Լ� : ����ÿ� null�� ó���ϴ� �Լ�
select * from employee;

-- nvl �Լ��� ������� �ʰ� ��ü ������ ���.
    -- null�� 0���� ó���ؼ� ���� �ؾ� ��. : nvl
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�,
salary * 12,    -- ��ü ����
salary * 12 + commission
from employee;

-- nvl �Լ��� ����ؼ� ����
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�,
salary * 12,    -- ��ü ����
salary * 12 + NVL(commission, 0)
from employee;

-- Ư�� �÷��� ������ �ߺ� ������ ���
select * from employee;
select dno from employee;
select distinct dno from employee;

select ename, distinct dno from employee; -- �ٸ� �÷� ������ ���� �� �� �ִ�.

-- ������ ����ؼ� �˻�(Where)
select * from employee;
select eno �����ȣ, ename �����, job ��å, manager ���ӻ��, hiredate �Ի糯¥,
    salary ����, commission ���ʽ�, dno �μ���ȣ
from employee;

-- �����Ȥ 7788�� ����� �̸��� �˻�
select * from employee
where eno = 7788;

select ename from employee
where eno = 7788;

-- �����ȣ�� 7788�� ����� �μ���ȣ, ���ް� �Ի糯¥�� �˻�
select dno �μ���ȣ, salary ����, hiredate �Ի糯¥
from employee
where eno = 7788;

desc employee;

select *
from employee
where ename = 'SMITH';

-- ���ڵ带 �����ö�
    -- number �϶��� ''�� ������ �ʴ´�.
    -- ���ڵ�����(char, varchar2)�� ��¥(date)�� �����ö��� ''�� ó��.
    -- ��ҹ��ڸ� ������

-- �Ի糯¥�� '81/12/03'�� ��� ���
select *
from employee
where hiredate = '81/12/03';
    
-- �μ��ڵ尡 10�� ��� ������� ���.
select ename, dno
from employee
where dno = 10;
    
select * from employee;

-- ������ 3000�̻��� ��� ���
select ename, dno, hiredate, salary
from employee
where salary >= 3000;

-- Null �˻� : isŰ���� ��� 
select *
from employee
where commission is Null;

-- commision�� 300�̻��� ����̸���, ��å, ������ ���
select ename, job, salary, commission
from employee
where commission >= 300;

-- Ŀ�̼��� ���� ������� �̸��� ���
select ename
from employee
where commission is null;

-- ���ǿ��� and, or, not

-- ������ 500 �̻� 2500 �̸��� ������� �̸�, ��� ��ȣ, �Ի糯¥ (and)���
select ename, eno, hiredate, salary
from employee
where salary < 2500 and salary >= 500;

--
select * from employee
-- ��å�� salesman�̰ų�, �μ��� 20�� ��� �̸�, ��å, ����, �μ��ڵ� ���
select ename, job, salary, dno
from employee
where job = 'SALESMAN' or dno = 20;
    
-- Ŀ�̼��� ���� ������߿� �μ��ڵ尡 20�� ������� �̸�, �μ��ڵ�, �Ի糯¥�� ���
select ename, hiredate, dno, commission
from employee
where commission is null and dno = 20;    
    
-- Ŀ�̼��� null�̾ƴ� ������� �̸�, �Ի糯¥, ����
select ename, hiredate, commission, salary
from employee
where commission is not null;

-- ��¥ �˻� :
select * from employee;

-- 1982/1/1 ~ 1983/12/31 ���̿� �Ի��� ����� �̸�, ��å, �Ի糯¥
select ename, job, hiredate 
from employee
where hiredate >= '1982/1/1' and hiredate < '1983/12/31'

-- 1981�⵵�� �Ի��� ����    
select ename, job, hiredate 
from employee
where hiredate >= '1981/1/1' and hiredate <= '1981/12/31';

-- between A and B : A �̻� B ����
select ename, job, hiredate 
from employee
where hiredate between '1981/1/1' and '1981/12/31';

-- IN ������

-- Ŀ�̼��� 300, 500, 1400�� ����� �̸�, ��å, �Ի����� ���
select * from employee;

select ename, job, hiredate 
from employee
where commission = 300 or commission = 500 or commission = 1400;

select ename, job, hiredate 
from employee
where commission in (300, 500, 1400);

-- like     : �÷����� Ư���� ���ڿ��� �˻�      <== �۰˻� ����� ����� ��
    -- %    : �ڿ� � ���ڰ� �͵� ��� ����.
    -- _    : �ѱ��ڰ� ����� �͵� �������.

-- F �� �����ϴ� �̸��� ���� ����� ��� �˻� �ϱ�.
select * from employee
where ename like 'A%';

-- �̸��� ES�� ������ ����� �˻� �ϱ�.
select * from employee
where ename like '%ES';

-- J�� ���۵ǰ� J���� �α��ڰ� ����� �͵� ������� ���, �ڿ��� ES�� ��������
select * from employee
where ename like 'J__ES';

-- ������ ���ڰ� R�� ������ ���
select * from employee
where ename like '%R';

-- MAN�ܾ �� ��å�� ���� ����� ���
select * from employee
where job like '%MAN%';

-- 81�⵵�� �Ի��� ����� ����ϱ�
select *
from employee
where hiredate >= '81/1/1' and hiredate <= '81/12/31';

select *
from employee
where hiredate between '81/1/1' and '81/12/31';

select *
from employee
where hiredate like '81%';

select *
from employee
where hiredate like '81/02%';

-- ���� : order by, asc(��������), , desc(��������)

select *
from employee
order by eno asc;   -- asc�� ���� ���� 

select *
from employee
order by eno desc; 

select *
from employee
order by ename desc; 

select *
from employee
order by hiredate desc; 

-- �����亯�� �Խ��ǿ��� �ַ� ���. �ΰ��̻��� �÷��� �����Ҷ�
select *
from employee
order by dno desc; 

-- �� ���� �÷��� ���� : ���� ó�� �÷��� ������ �ϰ�, ������ ���� ���ؼ� �ι�° �÷��� ����.
select dno, ename
from employee
order by dno, ename; 

select dno, ename
from employee
order by dno desc, ename; 

-- where���� order by���� ���� ���ɶ�.

select *
from employee
where commission is null
order by ename;

-- �پ��� �Լ� ����ϱ�
/*
    1. ���ڸ� ó���ϴ� �Լ�
        - UPPER     : �빮�ڷ� ��ȯ
        - LOWER     : �ҹ��ڷ� ��ȯ
        - INITCAP   : ù�ڴ� �빮�ڷ� �������� �ҹ��ڷ� ��ȯ
        
        dual ���̺� : �ϳ��� ����� ����ϵ��� �ϴ� ���̺�
*/

select '�ȳ��ϼ���' as �ȳ�
from dual

select 'Oracle Mania' , upper('Oracle maina'), lower('Oracle mania'), initcap('Oracle mania')
from dual

select * from employee;

select ename, lower(ename), initcap(ename), upper(ename)
from employee;

select * from employee
where ename = 'allen';

select * from employee
where lower(ename) = 'allen';

select * from employee
where initcap(ename) = 'Allen';

select ename, initcap(ename) from employee
where initcap(ename) = 'Allen';

-- ���� ���̸� ����ϴ� �Ԥ�
    -- lenght   : ������ ���̸� ��ȯ, �����̳� �ѱ� ������� ���ڼ��� ���
    -- lenghtb  : ������ ���̸� ��ȯ, �ѱ� 3byte�� ��ȯ,
    
select length ('Oracle mania'), length ('����Ŭ �ŴϾ�') from dual;

select lengthb ('Oracle mania'), lengthb ('����Ŭ �ŴϾ�') from dual;

select * from employee

select ename, length(ename), job, length(job)
from employee

-- ���� ���� �Լ�
    -- concat   : ���ڿ� ���ڸ� �����ؼ� ���
    -- substr   : ���ڸ� Ư�� ��ġ���� �߶���� �Լ�(����, �ѱ� ��� 1byte�� ó��)
    -- substrb  : ���ڸ� Ư�� ��ġ���� �߶���� �Լ�(������ 1byte, �ѱ��� 3byte�� ó��)
    -- instr    : ������ Ư����ġ�� �ε��� ���� ��ȯ
    -- instrb   : ������ Ư����ġ�� �ε��� ���� ��ȯ(������ 1byte, �ѱ��� 3byte�� ó��)
    -- lpad, rpad : �Է� ���� ���ڿ����� Ư�� ���ڸ� ����.
    -- trm      : �߶󳻰� ���� ���ڸ� ��ȯ.
    
select 'Oracle', 'mania', concat('Oracle', 'mania') 
from dual

select * from employee;

select concat(ename,'  ' || job) 
from employee;

select '�̸��� : ' || ename || '�̰�, ��å�� : ' || job || '�Դϴ�' as �÷�����
from employee;

select '�̸��� : ' || ename || '�̰�, ���ӻ������� : ' || manager || '�Դϴ�' as ����
from employee;

--substr(���, ������ġ, ���ⰹ��) : Ư�� ��ġ���� ���ڸ� �߶�´�. 
select 'Oracle mania', substr('Oracle mania', 4, 3), substr('����Ŭ �ŴϾ�', 2, 4)
from dual;

select 'Oracle mania', substr('Oracle mania', -4, 3), substr('����Ŭ �ŴϾ�', -6, 4)
from dual;

select ename, substr(ename, 2, 3) , substr(ename, -5, 2)
from employee;

select substrb('Oracle mania', 3, 3), substrb('����Ŭ �ŴϾ�', 4, 6)
from dual;

-- �̸��� N���� ������ ����� ��� �ϱ� (substr)���
select ename
from employee
where substr (ename, -1, 1) = 'N';

select ename
from employee
where ename like('%N');

-- 87�⵵ �Ի��� ����� ����ϱ�(substr)���
select ename, hiredate
from employee
where substr(hiredate, 0, 2) = '87';

select ename, hiredate
from employee
where hiredate like '87%';

-- instr(���, ã������, ������ġ, ���° �߰�)

select 'Oracle mania', instr('Oracle mania', 'O') 
from dual

select 'Oracle mania', instr('Oracle mania', 'a', 5, 2) 
from dual

select 'Oracle mania', instr('Oracle mania', 'a', -5, 1) 
from dual

select distinct instr (job, 'A' ,1 ,1) from employee
where lower(job) = 'manager';

-- lpad, rpad : Ư�� ���̸�ŭ ���ڿ��� �����ؼ� ����, �����ʿ� ������ Ư�� ���ڷ� ó��

select lpad(1234, 10, '#') 
from dual;

select rpad(1234, 10, '#') 
from dual;

select lpad(salary, 10, '*')
from employee;

-- TRIM : ��������, Ư�����ڵ� ����
    -- LTRIM : ���� ��������
    -- RTRIM : ������ ��������
    -- TRIM  : ���� ��������
    
select ltrim ('   Oracle mania   ') a, rtrim('   Oracle mania   ') b, trim('   Oracle mania   ') c
from dual;
















