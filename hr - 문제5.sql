-- 1.
create table dept(
    dno number(2) not null,    
    dname varchar2(14) null,   
    loc varchar2(13) null
    )
-- 2.

create table emp(
    eno number(4) not null,    
    ename varchar2(10) null,   
    dno number(2) null
    )

-- DB 설정에 따라서, NULL 허용 여부가 다르게 셋팅되어 있을 수 있다.

-- 3.

alter table emp
modify (ename varchar2(25));
    
-- 4.

create table employee2
as
select eno EMP_ID, ename NAME, salary SAL, dno DEPT_ID from employee;

-- 5.

drop table emp;

-- 6.

rename employee2 to emp;

-- 7.

select * from dept;

Alter Table dept
drop column dname;

-- 8.

alter table dept
set UNUSED (loc);

-- 9.
alter table dept
drop unused COLUMN;

-- 1.

create table emp_insert
as
select * from emp
where 0 = 1;    -- 조건을 false로 설정하려면

alter table emp_insert
add(hiredate date);

-- 2.

select * from emp_insert;

desc emp_insert;

insert into emp_insert
values(1234, '김문준', 55555.55, 07, sysdate);

-- 3.
insert into emp_insert
values(5678, '홍길동', 33333.33, 09, to_date('sysdate -1', 'YYYY-MM-DD'));

-- 4.
create table emp_copy
as
select * from employee;

-- 5.
update emp_copy
set dno = 10
where eno = 7788;
commit; -- 트랜잭션 처리

-- 6.
update emp_copy
set job = (select job from emp_copy where eno = 7499) , salary = (select salary from emp_copy where eno = 7499)
where eno = 7788;

commit;

select * from dept_copy;

-- 7. 
update emp_copy
set dno = (select dno from emp_copy where eno = 7369)
where job = (select job from emp_copy where eno = 7369);

-- 8.
create table dept_copy
as
select * from department;

-- 9.
select * from dept_copy;

delete dept_copy
where dname = 'RESEARCH'

-- 10.
delete dept_copy
where dno = 10 or dno = 40;


















