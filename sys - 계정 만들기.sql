show user;


-- �ְ� ������ ����(sys) : ������ ������ �� �ִ� ������ ������ �ִ�.
create user usertest01 identified by 1234;

-- ������ ��ȣ�� ���� �ߴٰ� �ؼ� ����Ŭ�� ������ �� �ִ°��� �ƴϴ�. ������ �ο��޾ƾ� �Ѵ�.

-- System Privileges :
    -- Create Session   : ������ ���� �� �� �ִ� ����.
    -- Create Table     : ����Ŭ���� ���̺��� ���� �� �� �ִ� ����.
    -- Create Sequence  : ������ ���� �� �� �ִ� ����.
    -- Create view      : �並 ���� �� �� �ִ� ����.
    
-- ������ �������� ����Ŭ�� ���� �� �� �ִ� Create Session������ �ο�.

/*
DDL : ��ü ����(Create, Alter, drop)
DML : ���ڵ� ����(Insert, update, delete)
DQL : ���ڵ� �˻�(Select)
DTL : Ʈ�����(Begin transaction, rollback, commit)
DCL : ���Ѱ���(Grant, Revoke, deny)
*/

-- ������ �������� ����Ŭ�� ���� �� �� �ִ� Create Session ������ �ο�
-- grant �ο��� ���� to ������
grant create session to usertest01;

-- ����Ŭ�� �����ߴٰ� �ؼ� ���̺� ������ �� �ִ� ������ �ִ� ���� �ƴϴ�.

grant create table to usertest01;

/* 
    ���̺� �����̽�(Table space)  : ��ü(���̺�, ��, ������, �ε���, Ʈ����, �������ν���, �Լ�...)
        �� �����ϴ� ����. ������ �������� �� ����ں� ���̺� �����̽��� Ȯ��.
        SYSTEM : DBA(������ ���������� ������ ����)
*/

select * from dba_users;    -- dba_ : sys(�ְ� ������ �������� Ȯ��)

select username, default_tablespace as DataFile, temporary_tablespace as LogFile
from dba_users
where username in('HR', 'USERTEST01', 'USERTEST02');

-- �������� ���̺� �����̽� ����(SYSTEM ==> USERS) ����
alter user usertest01
default tablespace users
temporary tablespace temp;

-- �������� Users ���̺� �����̽��� ��� �� �� �ִ� ���� �Ҵ�. (users ���̺� �����̽��� 2mb�� ��� �����Ҵ�)
alter user usertest01
quota 2m on users;

-- ���� usertest02 ���� ���� �Ŀ� users ���̺� �����̽����� ���̺�(tbl2) ������ �� insert

create user usertest02 identified by 1234;

grant create session to usertest02;

grant create table to usertest02;

alter user usertest02
default tablespace users;

alter user usertest02
quota unlimit on users;






















