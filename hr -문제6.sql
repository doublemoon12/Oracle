create table member(
    id varchar2(20) constraint PK_member_id Primary key not null,
    pwd varchar2(20),
    name varchar2(50),
    zipcode varchar2(7),
    address varchar2(20),
    tel varchar2(13),
    indate date default sysdate,
    CONSTRAINT FK_member_id_tb_zipcode foreign key(zipcode) REFERENCES tb_zipcode(zipcode)
    );

create table tb_zipcode(
    zipcode varchar2(7) CONSTRAINT PK_tb_zipcode_zipcode Primary key not null,
    sido varchar2(30),
    gugum varchar2(30),
    dong varchar2(30),
    bungi varchar2(30)
    );
drop table member;

create table products(
    product_code varchar2(20) CONSTRAINT PK_product_product_code Primary key not null,
    product_name varchar2(100),
    product_kind char(1),
    product_price1 varchar2(10),
    product_price2 varchar2(10),
    product_content varchar2(100),
    product_image varchar2(50),
    sizeSt varchar2(5),
    sizeEt varchar2(5),
    product_quantity varchar2(5),
    useyn char(1),
    indate date
    );
    
 create table orders(
    o_seq number(10) CONSTRAINT PK_orders_o_seq Primary key not null,
    product_code varchar2(20),
    id varchar2(16),
    product_size varchar2(5),
    quantity varchar2(5),
    result char(1),
    indate date,
    CONSTRAINT FK_orders_product FOREIGN key(product_code) REFERENCES products(product_code),
    CONSTRAINT FK_orders_id_member FOREIGN key(id) REFERENCES member(id)
    );

desc member;
    
insert into tb_zipcode
    values('555-555', '경기도, 안양시', '동안구', '평촌동', '433번지');

insert into member
    values('com', '1111', '김김김', '555-555', '어딘가', '010-0000-0000', default);
    
insert into products 
    values('2222', '밀가루', '1', '2000', '8000', '맛있는 밀가루', '밀가루', '1', '4', '999', '1', '2022-02-03');
    
insert into orders
    values(123445, '2222', 'doc', '3', '555', '1', '2022-03-03');
    
    
select * from products 

commit;

select * from user_constraints
where table_name = 'tb_zipcode';

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    