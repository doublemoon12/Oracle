-- 1.

create table emp_sample
as
select * from employee;

alter table emp_sample
add CONSTRAINT PK_my_emp_pk Primary key(eno);

-- 2.

create table dept_sample
as
select * from department;

alter table dept_sample
add CONSTRAINT PK_my_dept_pk Primary key(dno);

-- 3.

alter table emp_sample
add CONSTRAINT my_emp_dept_fk FOREIGN key(dno) REFERENCES dept_sample(dno);

-- 4.

update emp_sample
set commission = null
where commission = 0;

alter table emp_sample
add constraint my_emp_ck CHECK(commission > 0);

-- 5.

alter table emp_sample
modify salary default 1000;

-- 6.

alter table emp_sample
add constraint my_emp_uk UNIQUE(ename);

-- 7.

update emp_sample
set commission = 10
where commission is null;

alter table emp_sample
modify commission CONSTRAINT my_emp_nn not null;

select * from emp_sample;

-- 8.

select * from user_constraints
where table_name = 'EMP_SAMPLE';

alter table emp_sample
drop constraint PK_MY_EMP_PK;

alter table emp_sample
drop constraint MY_EMP_UK;

alter table emp_sample
drop constraint MY_EMP_NN;

alter table emp_sample
drop constraint MY_EMP_CK;

alter table emp_sample
drop constraint MY_EMP_FK;

alter table dept_sample
drop constraint PK_MY_DEPT_PK;

-- 1.

create view v_em_dno
as
select eno, ename, dno from employee
where dno = 20;

select * from v_em_dno;

-- 2


-- 3.

drop view v_em_dno;

-- 4.

create view v_sal_dno
as
select dno, min(salary) min, max(salary) max, avg(salary) avg, sum(salary) sum
from employee
group by dno;

-- 5.

alter view v_sal_dno read only;

