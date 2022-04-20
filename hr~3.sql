-- ���� �Լ�
/*
    ROUND   : Ư�� �ڸ������� �ݿø�.
    TRUNC   : Ư�� �ڸ������� �߶󳽴�.(������)
    MOD     : �Է� ���� ���� ���� ������ ���� ���
*/

-- round (���) : �Ҽ��� ���ڸ����� �ݿø�
-- round (���, �Ҽ��� ���� �ڸ���) : 
    -- �Ҽ��� �ڸ����� ����϶� : �Ҽ��� ���������� �ڸ�����ŭ �̵��ؼ� �� �ڸ��� �ڿ��� �ݿø�.
    -- �Ҽ��� �ڸ����� �����϶� : �Ҽ��� �������� �ڸ��� ��ŭ �̵��ϰ� �� �ڸ������� �ݿø�.
select 98.7654, round (98.7654), round (98.7654, 2), round(98.7654, -1), round(98.7654, -2),
round(98.7654, -3), round(98.7654, 3), round(212.7654, -1), round(212.7654, -2)
from dual;

select 12345.6789, round(12345.6789), round(12345.6789, 2), round(12345.6789, -3)
from dual;

select 98.7654, TRUNC(98.7654), TRUNC(98.7654, 2), TRUNC(98.7654, -1), TRUNC(98.7654, 1)
from dual;

-- MOD(���, ������ ��) : ����� ������ ���� ����� �������� ���
select MOD(31,2), mod(31,5), mod(31,8)
from dual;

select salary, mod(salary, 300) 
from employee;

-- employee ���̺��� �����ȣ�� ¦���� ����鸸 ���
select *
from employee
where mod (eno, 2) = 0;

/* ��¥ �Լ�
    sysdate : �ý��ۿ� ����� ���� ��¥�� ���.
    months_between  : �� ��¥ ���̰� �� ���������� ��ȯ
    add_months      : Ư�� ��¥�� �������� ���Ѵ�.
    next_day        : Ư�� ��¥���� ���ʷ� �����ϴ� ���ڷ� ���� ������ ��¥�� ��ȯ.
    last_day        : �޿� ������ ��¥�� ��ȯ.
    round           : ���ڷ� ���� ��¥�� Ư�� �������� �ݿø�.
    trunc           : ���ڷ� ���� ��¥�� Ư�� �������� ������.
*/

-- �ڽ��� �ý����� ��¥ ���.
select sysdate
from dual;

select sysdate -1 as ������¥, sysdate as ���ó�¥, sysdate +1 as ���ϳ�¥
from dual;

select *
from employee
order by hiredate;

select hiredate, hiredate -1, hiredate + 10
from employee
order by hiredate;

-- �Ի��Ͽ��� ���� ��������� �ٹ��ϼ��� ���
select sysdate - hiredate
from employee;

select round(sysdate - hiredate) as "�� �ٹ���"
from employee;

select round((sysdate - hiredate), 2) as "�� �ٹ���"
from employee;

select trunc(sysdate - hiredate) as "�� �ٹ���"
from employee;

-- Ư�� ��¥���� ��(Month)�� �������� ������ ��¥ ���ϱ�

select hiredate, trunc(hiredate, 'MONTH'), trunc(hiredate, 'year')
from employee;

-- Ư�� ��¥���� ��(Month)�� �������� �ݿø��� ��¥ ���ϱ� : 16�� �̻��� ��� �ݿø���.

select hiredate, round(hiredate, 'MONTH'), trunc(hiredate, 'year')
from employee;

-- months_between(date1, date2) : date1�� date2������ ������ ���̸� ���Ѵ�.

-- �Ի��Ϻ��� �� ������� ������� �ٹ��� ���� �� ���ϱ�

select ename, sysdate, hiredate, round((months_between(sysdate, hiredate)), 1) "�� �ٹ�����"
from employee;

-- add months (date1, ������) : date1��¥�� ���� ���� ���� ��¥�� ���.

-- �Ի��� �� 6������ ���� ������ ���

select hiredate, add_months(hiredate, 6)
from employee;

-- �Ի��� �� 100���� ���� ��¥

select hiredate, hiredate + 100 as "�Ի� �� 100�� �Ǵ³�¥"
from employee;

-- next_day (date, '����') : date�� �����ϴ� ���Ͽ� ���� ��¥�� ����ϴ� �Լ�

select sysdate, next_day(sysdate, '�����') as "�̹��� ����� ��¥"
from dual;

-- last_day(date) : date�� �� ���� ������ ��¥

select hiredate, last_day(hiredate) as "�� ���� ������ ��"
from employee;

-- �� ��ȯ �Լ� <== �߿�.
/*
    to_char     : ��¥�� �Ǵ� ������ �����͸� ���������� ��ȯ�ϴ� �Լ�.
    to_date     : �������� ��¥������ ��ȯ �ϴ� �Լ�.
    to_number   : �������� ���������� ��ȯ �ϴ� �Լ�.
*/

-- ��¥ �Լ� ����ϱ�

-- to_char(date, 'YYYYMMDD')

select ename, hiredate, to_char(hiredate, 'YYYYMMDD'), to_char(hiredate, 'YYMM'),
to_char(hiredate, 'yyyy/mmdd day'), to_char(hiredate, 'YYYYMMDD DY')
from employee;

-- ���ó�¥�� ����ϰ� �ð� �ʱ��� ���.

select sysdate, to_char(sysdate, 'YYYY/MM/DD HH:MI:SS DY')
from dual;

desc employee;

select hiredate, to_char(hiredate, 'YYYY_MM_DD HH:MI:SS DAY')
from employee;

-- to_char���� ���ڿ� ���õ� ����
/*
    0   : �ڸ����� ��Ÿ���� �ڸ����� ���� ���� ��� 0���� ä���.
    9   : �ڸ����� ��Ÿ���� �ڸ����� ���� ���� ��� ä���� �ʴ´�.
    L   : �� ������ ��ȭ ��ȣ�� ����� �ش�.
    .   : �Ҽ������� ǥ��
    ,   : õ������ ������
*/

select ename, salary, to_char(salary, 'L999,999'), to_char(salary, 'L000,000')
from employee;

-- to_date('char', 'format'): ��¥�������� ��ȯ.
-- to_date('nuber', 'format'): ��¥�������� ��ȯ.
-- ���� : date - char�̱� ����
select sysdate, sysdate - '20000101'
from dual;

-- 2000�� 1�� 1�Ͽ��� ���ñ����� �� ��
select sysdate, round(sysdate - to_date(20000101, 'YYYYMMDD'), 2) as ��
from dual;

select sysdate, to_date('02/10/10', 'YY/MM/DD') as "��¥ ������������", round((sysdate - to_date('021010', 'YYMMDD')), 2) as "��¥�� ��", sysdate - '021010'
from dual;

select ename, hiredate
from employee
where hiredate = '81/02/22';

select ename, hiredate
from employee
where hiredate = to_date(19810222, 'YYYYMMDD');

select ename, hiredate
from employee
where hiredate = to_date('1981-02-22', 'YYYY-MM-DD');

-- 2000�� 12�� 25�� ���� ���ñ��� �� ����� �������� ���

select round((MONTHS_BETWEEN(sysdate, to_date(20001225, 'YYYYMMDD'))), 2) as "���� ��¥"
from dual;

select round((MONTHS_BETWEEN(sysdate, to_date('2000/12/25', 'YYYY/MM/DD'))), 2) as "���� ��¥"
from dual;

-- to_number : number ������ Ÿ������ ��ȯ

select 100000 - 50000
from dual;

-- ���� �߻� : ���ڿ� - ���ڿ�
select '100,000' - '50,000'
from dual;

select to_number('100,000', '999,999') - TO_NUMBER('50,000', '999,999') as "������ ����"
from dual;

-- NVL�Լ� : NULL�� �ٸ� ������ ġȯ���ִ� �Լ�
    -- nvl(expr1, expr2) : expr1���� null�� ������ expr2�� ��ȯ�ض�

select commission
from employee;

select commission, nvl(commission, 0)
from employee;

select manager
from employee;

select manager, nvl(manager, 9999)
from employee;

-- nvl2�Լ�
    -- nvl2(expr1, expr2, expr3) : exprl1�� null�� �ƴϸ� expr2�� �����ϰ� null�ϰ�� expl2�� ����ض�

select salary, commission
from employee;

-- nvl �Լ��� ���� ����ϱ�

select salary, salary * 12, salary*12 + nvl(commission, 0) as ����
from employee;

select salary, salary * 12, salary*12 + nvl2(commission, commission, 0) as ����
from employee;

select salary, salary * 12, nvl2(commission, salary*12 + commission, salary*12) as ����
from employee;

-- nullif : �� ǥ������ ���ؼ� ������ ��� null�� ��ȯ�ϰ� �������� �ʴ� ��� ù��° ǥ������ ��ȯ.
    -- nullif(expr1, expr2) :
select nullif('A', 'A'), nullif('A', 'B')
from dual;

-- coalesce �Լ�
-- coalesce(expr1, expr2, expr3....expr-n) : 
    -- expr1�� null�� �ƴϸ� expr1�� ��ȯ�ϰ�, 
    -- expr1�� null�̰� expr2�� null�� �ƴϸ� expr2�� ��ȯ
    -- expr1�� null�̰� expr2�� null�̰� expr3�� null�� �ƴϸ� expr3�� ��ȯ

select coalesce('abc', 'bcd', 'def', 'efg', 'fgi')
from dual;

select coalesce(null, 'bcd', 'def', 'efg', 'fgi')
from dual;

select coalesce(null, null, null, 'efg', 'fgi')
from dual;

select ename, salary, commission, coalesce(commission, salary, 0)
from employee;

-- decode �Լ� : switch case���� ������ ����

/*
    DECODE(ǥ����, ����, ���1,
                  ����, ���2,
                  ����, ���3,
                  �⺻���n
                  )
*/

select ename, dno, decode(dno, 10, 'ACCOUNTING',
                               20, 'RESEARCH',
                               30, 'SALES',
                               40, 'OPERATIONS',
                               'DEFAULT') as DNAME
from employee;

-- dno�� 10�� �μ��� ��� ���޿��� + 300, 20�� �μ��� ��� + 500, 30�� �μ��� ��� + 700
-- �̸�, ����, �μ��� +�� ������ ���
select * from employee;

select ename, salary, decode(dno, 10, salary + 300,
                                  20, salary + 500,
                                  30, salary + 700) as "+����"
from employee
ORDER BY dno asc;

-- case : if ~ else if, else if .... else
/*
    case ǥ���� when ����1 then ���1
               when ����2 then ���2
               else ���n
    END 
*/

select ename, dno, case when dno = 10 then 'ACCOUNTING'
                        when dno = 20 then 'RESERCH'
                        when dno = 30 then 'SALSE'
                        ELSE 'DEFAULT'
                    END as �μ���
from employee
order by dno;


















