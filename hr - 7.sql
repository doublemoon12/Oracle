-- 7���� - ��������

-- ���̺� ���� : ���̺��� ��ü�� ������.
    -- ���̺��� �����ϸ�, �÷��� ���ڵ常 ���簡 ��.
    -- ���̺��� �Ҵ�� ���������� ���� ���� �ʴ´�.(Alter Table�� ����ؼ� �Ҵ��ؾ� �Ѵ�.)
    -- �������� : �÷��� �Ҵ� �Ǿ� �ִ�. ���Ἲ�� üũ
        -- NOT NULL, Primary Key, Unique, Foreign Key, Check, defalut
        
-- ���̺��� ��ü ���ڵ鸦 ����
create table dept_copy
as
select * from department;

desc department;
desc dept_copy;

select * from dept_copy;

create table emp_copy
as
select * from employee;

select * from emp_copy;

-- ���̺� ���� : Ư�� �÷��� ����
create table emp_second
as
select eno, ename, salary, dno from employee;

select * from emp_second;

-- ���̺� ���� : ������ ����ؼ� ���̺� ����.
create table emp_third
as
select eno, ename salary
from employee
where salary > 2000;

select * from emp_third;

-- ���̺� ���� : �÷����� �ٲپ ����
create table emp_fourth
as
select eno �����ȣ, ename �����, salary ����
from employee;

select �����ȣ, �����, ���� from emp_fourth;   -- ���̺���̳� �÷����� ���� ����

-- ���̺� ���� : ������ �̿��ؼ� ���̺� ���� : �ݵ�� ��Ī�̸��� ����ؾ� �Ѵ�.
create table emp_fifth
as
select eno, ename, salary * 12 as salary from employee;

select * from emp_fifth;

-- ���̺� ���� : ���̺� ������ ����, ���ڵ�� �������� �ʴ´�.

create table emp_sixth
as
select * from employee
where 0 = 1;        -- where ���� : false�� ����

select * from emp_sixth;
desc emp_sixth;

-- ���̺� ���� : Alter Table
create table dept20
as
select * from department;

desc dept20;

select * from dept20;

-- ������ ���̺��� �÷��� �߰�

Alter Table dept20
add (birth date);

alter table dept20
add (email varchar2(100));

alter table dept20
add (address varchar2(200));

-- �÷��� �ڷ����� ���� :
alter table tb_zipcode
modify bungi varchar2(50);

alter table dept20
modify dname varchar2(100);

alter table dept20
modify dno number(4);

desc dept20;

alter table dept20
modify address Nvarchar2(200);

-- Ư�� �÷� ���� : �����ð� �ܿ� �۾�. (���ϰ� ���� �ɸ� �� �ִ�.)

Alter Table dept20
drop column birth;

select * from dept20;

alter table dept20
drop column email;

-- �÷��� �����ÿ� ���ϰ� ���� �߻��� ��.
    -- SET UNUSED : Ư�� �÷��� �Ͻ������� ��� ����,(������), ������ �߰���.

alter table dept20
set unused(address);

desc dept30;

alter table dept20  -- �߰��� ��������� �÷��� ����.
drop unused column; -- ������� �ʴ� �÷��� ���� ��.

-- �÷� �̸� ����

alter table dept20
rename column loc to locations;

alter table dept20
rename column dno to D_Number;

-- ���̺� �̸� ���� 

rename dept20 to dept30;

-- ���̺� ����

drop table dept30;

/*
    DDL : Create(����), Alter(����), Drop(����)
        <��ü>
        ���̺�, ��, �ε��� ,Ʈ����, ������, �Լ�, �������ν���...
*/

/*
    DML : Insert(���ڵ� �߰�), Update(���ڵ� ����), Delete(���ڵ� ����)
    << ���̺��� ��(���ڵ�, �ο�) >>
*/

/*
    DQL : Select
*/

/*
    ���̺��� ��ü �����̳� ���̺� ������
    1. delete   : ���̺��� ���ڵ带 ����, where�� ������� �ʴ°�� ��� ���ڵ� ����
    2. truncate : ���̺��� ���ڵ带 ����, �ӵ��� ������ ������.
    3. drop     : ���̺� ��ü�� ����, 
*/

create table emp30
as
select * from employee;

select * from emp30;

-- emp10 : delete�� ����� ����
delete emp10;
commit;
-- emp20 : truncate�� ����� ���� : commit���ص� ��
truncate table emp20;

-- emp30 : drop�� ����ؼ� ����

drop table emp;
drop table emp_copy;

/*
    ������ ���� : �ý����� ���� ������ ����� �ִ� ���̺�
        user_   : �ڽ��� ������ ���� ��ü������ ���
        all_    : �ڽ��� ������ ������ ��ü�� ������ �ο� ���� ��ü
        dba_    : ������ ���̽� �����ڸ� ���� ������ ��ü ������ ���
*/

show user;
select * from user_tables;          -- ����ڰ� ������ ���̺� ���� ���
select table_name from user_tables;
select * from user_views;           -- ����ڰ� ������ �� ���� ���� ���
select * from user_indexes;         -- ����ڰ� ������ �ε����� ���� ���� ���
select * from user_constraints;     -- ���� ���� Ȯ��
select * from user_sequences;

select * from user_constraints
where table_name = 'EMPLOYEE';

select * from all_tables;           -- ��� ���̺��� ���, ������ �ο� ���� ���̺� ���.
select * from all_views;

select * from dba_tables;           -- ������ ���������� ���� ����

/*
    ���� ���� : ���̺��� ���Ἲ�� Ȯ�� �ϱ� ���ؼ� �÷��� �ο��Ǵ� ��Ģ.
    1. Primary Key
    2. Unique
    3. NOT NULL
    4. CHECK
    5. FOREIGN KEY
    6. DEFALUT
*/

-- 1. Primary Key : �ߺ��� ���� ���� �� ����.
    
    -- a. ���̺� ������ �÷��� ���� ���� �ο�
        -- ���� ���� �̸� : �������� ������� : Oracle���� ������ �̸����� ����,
            -- ���������� �����Ҷ� �������� �̸��� ����ؼ� ����.
            -- PK_customer01_id     : Primary Key, customer01, id
            -- NN_customer01_pwd    : Not Null, customer01(���̺��), id(�÷���)
        
    create table customer01(
        id varchar2(20) not null constraint PK_customer01_id Primary Key,
        pwd varchar2(20) constraint NN_customer01_pwd not null,
        name varchar2(20) constraint NN_customer01_name not null,
        phone varchar2(30) null,
        adress varchar2(100) null
        );
        
select * from user_constraints
where table_name = 'CUSTOMER01';

     create table customer02(
        id varchar2(20) not null Primary Key,
        pwd varchar2(20) not null,
        name varchar2(20) not null,
        phone varchar2(30) null,
        adress varchar2(100) null
        );

select * from user_constraints
where table_name = 'CUSTOMER02';

-- ���̺��� �÷� ������ ���� ���� �Ҵ�.
    
    create table customer03(
        id varchar2(20) not null,
        pwd varchar2(20) constraint NN_customer03_pwd not null,
        name varchar2(20) constraint NN_customer03_name not null,
        phone varchar2(30) null,
        adress varchar2(100) null,
        constraint PK_customer03_id Primary Key(id)
        );

/*
    Foreign Key (����Ű) : �ٸ� ���̺�(�θ�)�� Primary Key, Unique �÷��� ���� �ؼ� ���� �Ҵ�.
    check : �÷��� ���� �Ҵ��� �� check�� �´� ���� �Ҵ�.
*/
-- �θ� ���̺�
    create table ParentTbl(
        name varchar2(20),
        age number(3) constraint CK_ParentTbl_age check (AGE > 0 and AGE < 200),
        gender varchar(3) constraint CK_ParentTbl_gender check(gender IN ('M', 'W')),
        infono number constraint PK_ParentTbl_infono Primary Key
        );
    
desc parentTbl;
select * from user_constraints
where table_name = 'PARENTTBL';

select * from parentTbl;

insert into ParentTbl
values('ȫ�浿', 30, 'M', 1);

insert into ParentTbl
values('��ʶ�', 300, 'K', 1);  -- ���� �߻� : 300(check ����), K(check ����), 1(Primary Key ����

insert into ParentTbl
values('��ʶ�', 50, 'M', 2);  -- ���� �߻� : 300(check ����), K(check ����), 1(Primary Key ����


-- �ڽ� ���̺�
create table ChildTbl(
    id varchar2(40) constraint PK_ChildTbl_id Primary Key,
    pw varchar2(40),
    infono number,
    constraint FK_ChildTbl_infono foreign key(infono) references ParentTbl(infono)
    );

insert into ChildTbl
values('aaa', '1234', 1);

create table ParentTbl2 (
    dno number(2) not null Primary key,
    dname varchar2(50) ,
    loc varchar2(50)
    );
    
    insert into ParentTbl2
    values (10, 'SALES', 'SEOUL');


insert into ParentTbl2
values(10, 'SALES', 'SEOUL')

create table ChildTbl2(
    no number not null,
    ename varchar(50),
    dno number(2) not null,
    foreign key(dno) references ParentTbl2(dno)
    );
    
insert into ChildTbl2
values(1, 'Park', 10);

select * from ChildTbl2

-- default ���� ���� : ���� �Ҵ� ���� ������ default���� �Ҵ�.

Create Table emp_sample01(
    eno number(4) not null Primary key,
    ename varchar(50),
    salary number(7,2) default 1000
    );

select * from emp_sample01;

-- default �÷��� ���� �Ҵ��� ���.
insert into emp_sample01
values(1111, 'ȫ�浿', 1500);

-- default �÷��� ���� �Ҵ����� ���� ���.
insert into emp_sample01(eno, ename)
values(2222, '������');

insert into emp_sample01
values(3333, '������', default);

Create Table emp_sample02(
    eno number(4) not null Primary key,
    ename varchar(50) default 'ȫȫȫ',
    salary number(7,2) default 1000
    );

insert into emp_sample02 (eno)
values(10);

select * from emp_sample02;

insert into emp_sample02
values(20, default , default);

/*
    Primary Key, Foreign Key, Unique, Check, Default, not null
*/

create table member10(
    no number not null constraint PK_member10_no Primary Key,
    name varchar(50) constraint NN_member10_name Not null,
    birthday date default sysdate,
    age number(3) check (age > 0 and age < 150),
    gender char(1) check(gender in('M', 'W')),
    dno number(2) Unique 
    );

insert into member10
values(1, 'ȫ�浿', default, 30, 'M', 10);

insert into member10
values(2, '������', default, 20, 'M', 20);

select * from member10;

create table orders10(
    no number not null Primary key,
    p_no varchar(100) not null,
    p_name varchar(100) not null,
    price number check (price > 10),
    phone varchar(100) default '010-0000-0000',
    dno number(2) not null,
    foreign key(dno) references member10(dno)
    );

INSERT INto orders10
values(1, '1111', '������', 5000, default, 10);

select * from orders10

-- ���̺� ������(Foreign key) : �θ����̺�(FK���� ���̺�)�� ���� ���� �ؾ� �Ѵ�. �ڽ����̺� ����.
    -- �ڽ� ���̺��� ���� �Ҷ� FK�� ���� �ʰ� ������, �θ����̺� �����ϰ� Alter Table�� ����ؼ� ���߿� FK�� �־��ش�.

/*
    Foreign Key�� �����Ǵ� ���̺� ������
        1. 
*/

-- cascade constraints �ɼ��� ����ؼ� ����, <== Foreign Key���������� ���� ������ ����.

drop table member cascade constraints;
drop table tb_zipcode cascade constraints;
drop table products cascade constraints;
drop table orders cascade constraints;

-- ���̺� ������ ���� ���� : �ٸ� ���̺��� Foreign key�� �ڽ��� ���̺��� �����ϰ� ������ ������ �ȵ�.
    -- �ٸ����̺��� ���� �ϰ� �ִ��� ������ �����ϴ� �ɼ� : cascade

-- ���������� ������ ���̺� ����
alter table member
drop constraint FK_MEMBER_ZIPCODE_TB_ZIPCODE


-- ����

-- �÷��̸� ����. (bungi  ==> bunji) ����
alter table tb_zipcode
rename column bungi to bunji; 

alter table tb_zipcode
rename column gugum to gugun; 

-- ������ �ڸ��� �÷��ֱ�
Alter Table tb_zipcode
modify ZIPCODE varchar2 (100);

Alter Table tb_zipcode
modify DONG varchar2 (100);

--���� ���� ��� ��Ȱ��ȭ �ϱ� . (��� ��Ȱ��ȭ �ϱ�) <== Bulk Insert (�뷮���� ���� insert) : ���� �������� ���ؼ� insert�Ǵ� �ӵ��� ������ ������.
alter table tb_zipcode
disable constraint PK_tb_zipcode_zipcode    -- ���� �߻� : member���̺��� zipcode�÷��� �����ϰ� �ִ�.

alter table tb_zipcode
disable constraint PK_tb_zipcode_zipcode cascade -- Member���̺��� FK�� ����� ���� ���ǵ� �Բ� disable

select * from user_constraints
where table_name in ('MEMBER', 'TB_ZIPCODE')

select constraint_name, table_name, status from user_constraints
where table_name in ('MEMBER', 'TB_ZIPCODE')

select * from tb_zipcode;

truncate table tb_zipcode; -- ������ ���ڵ常 ��� ����(������ ��� ���ڵ� ����)

delete tb_zipcode;  -- ������ ���ڵ常 ��� ����(�뷮�ϰ�� ������ ������, Ŀ���ؾ��Ѵ�.)
commit;

select constraint_name, table_name, status from user_constraints
where table_name in ('MEMBER', 'TB_ZIPCODE');

-- ���� ���� Ȱ��ȭ �ϱ� 
alter table member
enable novalidate constraint FK_member_zipcode_tb_zipcode;

alter table tb_zipcode
enable novalidate constraint PK_tb_zipcode_zipcode ;

-- zip_seq �÷��� ������ ����� �ȵ� ����, ����� ���� �ǵ���.
    -- ���� ���� �������� ��� �Ǿ��� ����, to_number�� �̿��Ͽ� ���ڷ� ��ȯ�� ����
select * from tb_zipcode
order by to_number(zip_seq) asc; 

truncate table tb_zipcode;

select * from tb_zipcode
where zip_seq = 1;

-- ���� ������ ����(Alter Table) : ������ ���̺� ���� ������ ����

create table emp_copy50
as
select * from employee;

create table dept_copy50
as
select * from department;

select * from emp_copy50;
select * from dept_copy50;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT')

select * from user_constraints
where table_name in ('EMP_COPY50', 'DEPT_COPY50')

-- ���̺��� �����ϸ� ���ڵ常 ����ȴ� ���������� ������� �ʴ´�.
    -- Alter Table�� �̿��Ͽ� ���� ���� ����

alter table emp_copy50
add constraint PK_emp_copy50_eno Primary key(eno);

alter table dept_copy50
add constraint PK_dept_copy50 Primary key(dno);

-- Foreign Key
alter table emp_copy50
add constraint FK_emp_copy50_dno_dept_copy50 foreign key(dno) references dept_copy50(dno);

-- not NULL ���� ���� �߰�.
desc employee;
desc emp_copy50;    -- Not Null�� ���� �ʾ�����, Primary Key ���� ������ �Ҵ�.
desc department;
desc dept_copy50;   -- Primary Key�������� �ڵ����� Not Null

    -- ������ null�� ���ִ� ������ not null�÷����� ������ �� ����.
select ename from emp_copy50
where ename is null;

alter table emp_copy50
modify ename constraint NN_emp_copy50_ename not null;

-- commission �÷��� not null �Ҵ��ϱ� : null�� ���ִ� ��� null�� ó��

alter table emp_copy50
modify commission constraint NN_emp_copy50_commission not null;

update emp_copy50
set commission = 0
where commission is null;

-- Unique ���� ���� �߰� : �÷��� �ߺ��� ���� ������ �Ҵ����� ���Ѵ�.

select ename, count(*)
from emp_copy50
group by ename
having count(*) > 2;

alter table emp_copy50
add constraint UK_emp_copy50_ename unique (ename);

-- check ���� ���� �߰�

select * from emp_copy50;

alter table emp_copy50
add constraint CK_enp_copy50_salary check(salary > 0 and salary < 10000)

-- default ���� ���� �߰� <���������� �ƴ� : �������� �̸��� �Ҵ� �� �� ����.>
    -- ���� ���� ������� default�� ������ ���� ����.
alter table emp_copy50
modify salary default 1000;

alter table emp_copy50
modify hiredate default sysdate;

desc emp_copy50
insert into emp_copy50 (eno, ename, commission)
values(9999, 'JULI', 100);

insert into emp_copy50
values(8888, 'JULIA', null, null, default, default, 1500, null);

-- ���� ���� ���� : Alter Table ���̺�� drop

-- Primary key ���� : ���̺� �ϳ��� ����
alter table emp_copy50  -- ���� ���� ���ŵ�
drop primary key;

alter table dept_copy50  -- ���� : foreign key�� �����ϱ� ������ ���� �ȵ�
drop primary key;

alter table dept_copy50  -- foreign key�� �����ϰ� primary key ����
drop primary key cascade;

select * from user_constraints
where table_name in('EMP_COPY50', 'DEPT_COPY50');

-- not null �÷� ���� �ϱ� : ���� ���� �̸����� ����

alter table emp_copy50
drop constraint NN_EMP_COPY50_ENAME;

-- Unique, check ���� ���� ����<<�������� �̸����� ����>>
alter table emp_copy50
drop constraint UK_EMP_COPY50_ENAME;

alter table emp_copy50
drop constraint CK_EMP_COPY50_SALARY;

alter table emp_copy50
drop constraint NN_EMP_COPY50_COMMISSION;

-- default�� null ��� �÷��� default null�� ���� : default���� ������ �����ϴ� ��.

alter table emp_copy50
modify hiredate default null;

-- �������� disable / enable
    -- ���� ������ ��� �������� ����
    -- �뷮(Bulk Insert)���� ���� ���̺� �߰��� �� ���ϰ� ���� �ɸ���. disable ==> enable
    -- Index�� ������ ���ϰ� ���� �ɸ���.   disable ==> enable
    
alter table dept_copy50
add constraint PK_dept_copy50_dno Primary Key(dno);

alter table emp_copy50
add constraint PK_emp_copy50_eno Primary Key(eno);

alter table emp_copy50
add constraint FK_emp_copy50_dno Foreign Key(dno) references dept_copy50(dno);

select * from user_constraints
where table_name in('EMP_COPY50', 'DEPT_COPY50')

select * from emp_copy50;
select * from dept_copy50;

alter table emp_copy50
disable constraint FK_emp_copy50_dno;

insert into emp_copy50(eno, ename, dno)
values (8989, 'aaaa', 50);

insert into dept_copy50
values (50, 'HR', 'SEOUL');

alter table emp_copy50
enable constraint FK_emp_copy50_dno;
