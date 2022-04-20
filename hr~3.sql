-- 숫자 함수
/*
    ROUND   : 특정 자릿수에서 반올림.
    TRUNC   : 특정 자릿수에서 잘라낸다.(버린다)
    MOD     : 입력 받은 수를 나눈 나머지 값만 출력
*/

-- round (대상) : 소숫점 뒷자리에서 반올림
-- round (대상, 소숫점 기준 자릿수) : 
    -- 소숫점 자릿수가 양수일때 : 소숫점 오른쪽으로 자릿수만큼 이동해서 그 자릿수 뒤에서 반올림.
    -- 소숫점 자릿수가 음수일때 : 소숫점 왼쪽으로 자릿수 만큼 이동하고 그 자릿수에서 반올림.
select 98.7654, round (98.7654), round (98.7654, 2), round(98.7654, -1), round(98.7654, -2),
round(98.7654, -3), round(98.7654, 3), round(212.7654, -1), round(212.7654, -2)
from dual;

select 12345.6789, round(12345.6789), round(12345.6789, 2), round(12345.6789, -3)
from dual;

select 98.7654, TRUNC(98.7654), TRUNC(98.7654, 2), TRUNC(98.7654, -1), TRUNC(98.7654, 1)
from dual;

-- MOD(대상, 나누는 수) : 대상을 나누는 수로 나누어서 나머지만 출력
select MOD(31,2), mod(31,5), mod(31,8)
from dual;

select salary, mod(salary, 300) 
from employee;

-- employee 테이블에서 사원번호가 짝수인 사원들만 출력
select *
from employee
where mod (eno, 2) = 0;

/* 날짜 함수
    sysdate : 시스템에 저장된 현재 날짜를 출력.
    months_between  : 두 날짜 사이가 몇 개월인지를 반환
    add_months      : 특정 날짜에 개월수를 더한다.
    next_day        : 특정 날짜에서 최초로 도래하는 인자로 받은 요일의 날짜를 반환.
    last_day        : 달에 마지막 날짜를 반환.
    round           : 인자로 받은 날짜를 특정 기준으로 반올림.
    trunc           : 인자로 받은 날짜를 특정 기준으로 버린다.
*/

-- 자신의 시스템의 날짜 출력.
select sysdate
from dual;

select sysdate -1 as 어제날짜, sysdate as 오늘날짜, sysdate +1 as 내일날짜
from dual;

select *
from employee
order by hiredate;

select hiredate, hiredate -1, hiredate + 10
from employee
order by hiredate;

-- 입사일에서 부터 현재까지의 근무일수를 출력
select sysdate - hiredate
from employee;

select round(sysdate - hiredate) as "총 근무일"
from employee;

select round((sysdate - hiredate), 2) as "총 근무일"
from employee;

select trunc(sysdate - hiredate) as "총 근무일"
from employee;

-- 특정 날짜에서 월(Month)를 기준으로 버림한 날짜 구하기

select hiredate, trunc(hiredate, 'MONTH'), trunc(hiredate, 'year')
from employee;

-- 특정 날짜에서 월(Month)을 기준으로 반올림한 날짜 구하기 : 16일 이상일 경우 반올림됨.

select hiredate, round(hiredate, 'MONTH'), trunc(hiredate, 'year')
from employee;

-- months_between(date1, date2) : date1과 date2사이의 개월수 차이를 구한다.

-- 입사일부터 각 사원들의 현재까지 근무한 개월 수 구하기

select ename, sysdate, hiredate, round((months_between(sysdate, hiredate)), 1) "총 근무개월"
from employee;

-- add months (date1, 개월수) : date1날짜에 개월 수를 더한 날짜를 출력.

-- 입사한 후 6개월이 지난 시점을 출력

select hiredate, add_months(hiredate, 6)
from employee;

-- 입사한 후 100일이 지난 날짜

select hiredate, hiredate + 100 as "입사 후 100일 되는날짜"
from employee;

-- next_day (date, '요일') : date의 도래하는 요일에 대한 날짜를 출력하는 함수

select sysdate, next_day(sysdate, '토요일') as "이번주 토요일 날짜"
from dual;

-- last_day(date) : date에 들어간 달의 마지막 날짜

select hiredate, last_day(hiredate) as "그 달의 마지막 날"
from employee;

-- 형 변환 함수 <== 중요.
/*
    to_char     : 날짜형 또는 숫자형 데이터를 문자형으로 변환하는 함수.
    to_date     : 문자형을 날짜형으로 변환 하는 함수.
    to_number   : 문자형을 숫자형으로 변환 하는 함수.
*/

-- 날짜 함수 사용하기

-- to_char(date, 'YYYYMMDD')

select ename, hiredate, to_char(hiredate, 'YYYYMMDD'), to_char(hiredate, 'YYMM'),
to_char(hiredate, 'yyyy/mmdd day'), to_char(hiredate, 'YYYYMMDD DY')
from employee;

-- 오늘날짜를 출력하고 시간 초까지 출력.

select sysdate, to_char(sysdate, 'YYYY/MM/DD HH:MI:SS DY')
from dual;

desc employee;

select hiredate, to_char(hiredate, 'YYYY_MM_DD HH:MI:SS DAY')
from employee;

-- to_char에서 숫자와 관련된 형식
/*
    0   : 자릿수를 나타내며 자릿수가 맞지 않을 경우 0으로 채운다.
    9   : 자릿수를 나타내며 자릿수가 맞지 않을 경우 채우지 않는다.
    L   : 각 지역별 통화 기호를 출력해 준다.
    .   : 소수점으로 표현
    ,   : 천단위의 구분자
*/

select ename, salary, to_char(salary, 'L999,999'), to_char(salary, 'L000,000')
from employee;

-- to_date('char', 'format'): 날짜형식으로 변환.
-- to_date('nuber', 'format'): 날짜형식으로 변환.
-- 오류 : date - char이기 때문
select sysdate, sysdate - '20000101'
from dual;

-- 2000년 1월 1일에서 오늘까지의 일 수
select sysdate, round(sysdate - to_date(20000101, 'YYYYMMDD'), 2) as 일
from dual;

select sysdate, to_date('02/10/10', 'YY/MM/DD') as "날짜 데이터형으로", round((sysdate - to_date('021010', 'YYMMDD')), 2) as "날짜의 차", sysdate - '021010'
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

-- 2000년 12월 25일 부터 오늘까지 총 몇달이 지났는지 출력

select round((MONTHS_BETWEEN(sysdate, to_date(20001225, 'YYYYMMDD'))), 2) as "지난 날짜"
from dual;

select round((MONTHS_BETWEEN(sysdate, to_date('2000/12/25', 'YYYY/MM/DD'))), 2) as "지난 날짜"
from dual;

-- to_number : number 데이터 타입으로 변환

select 100000 - 50000
from dual;

-- 오류 발생 : 문자열 - 문자열
select '100,000' - '50,000'
from dual;

select to_number('100,000', '999,999') - TO_NUMBER('50,000', '999,999') as "숫자형 변형"
from dual;

-- NVL함수 : NULL을 다른 값으로 치환해주는 함수
    -- nvl(expr1, expr2) : expr1에서 null이 나오면 expr2로 변환해라

select commission
from employee;

select commission, nvl(commission, 0)
from employee;

select manager
from employee;

select manager, nvl(manager, 9999)
from employee;

-- nvl2함수
    -- nvl2(expr1, expr2, expr3) : exprl1이 null이 아니면 expr2를 진행하고 null일경우 expl2를 출력해라

select salary, commission
from employee;

-- nvl 함수로 연봉 계산하기

select salary, salary * 12, salary*12 + nvl(commission, 0) as 연봉
from employee;

select salary, salary * 12, salary*12 + nvl2(commission, commission, 0) as 연봉
from employee;

select salary, salary * 12, nvl2(commission, salary*12 + commission, salary*12) as 연봉
from employee;

-- nullif : 두 표현식을 비교해서 동일한 경우 null을 반환하고 동일하지 않는 경우 첫번째 표현식을 반환.
    -- nullif(expr1, expr2) :
select nullif('A', 'A'), nullif('A', 'B')
from dual;

-- coalesce 함수
-- coalesce(expr1, expr2, expr3....expr-n) : 
    -- expr1이 null이 아니면 expr1을 반환하고, 
    -- expr1이 null이고 expr2가 null이 아니면 expr2를 반환
    -- expr1이 null이고 expr2도 null이고 expr3가 null이 아니면 expr3를 반환

select coalesce('abc', 'bcd', 'def', 'efg', 'fgi')
from dual;

select coalesce(null, 'bcd', 'def', 'efg', 'fgi')
from dual;

select coalesce(null, null, null, 'efg', 'fgi')
from dual;

select ename, salary, commission, coalesce(commission, salary, 0)
from employee;

-- decode 함수 : switch case문과 동일한 구문

/*
    DECODE(표현식, 조건, 결과1,
                  조건, 결과2,
                  조건, 결과3,
                  기본결과n
                  )
*/

select ename, dno, decode(dno, 10, 'ACCOUNTING',
                               20, 'RESEARCH',
                               30, 'SALES',
                               40, 'OPERATIONS',
                               'DEFAULT') as DNAME
from employee;

-- dno가 10번 부서인 경우 월급에서 + 300, 20번 부서일 경우 + 500, 30번 부서일 경우 + 700
-- 이름, 월급, 부서별 +한 월급을 출력
select * from employee;

select ename, salary, decode(dno, 10, salary + 300,
                                  20, salary + 500,
                                  30, salary + 700) as "+월급"
from employee
ORDER BY dno asc;

-- case : if ~ else if, else if .... else
/*
    case 표현식 when 조건1 then 결과1
               when 조건2 then 결과2
               else 결과n
    END 
*/

select ename, dno, case when dno = 10 then 'ACCOUNTING'
                        when dno = 20 then 'RESERCH'
                        when dno = 30 then 'SALSE'
                        ELSE 'DEFAULT'
                    END as 부서명
from employee
order by dno;


















