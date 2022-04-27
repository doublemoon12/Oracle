create table tb_zipcode(
    zipcode varchar2(7) constraint PK_tb_zipcode_zipcode Primary key not null,
    sido varchar2(50),
    gugum varchar2(50),
    dnog varchar2(50),
    bungi varchar(100),
    zip_seq varchar2(30)
    );

drop table tb_zipcode