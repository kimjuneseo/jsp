create table goods_tbl_002(
	goods_cd varchar2(6) primary key,
	goods_nm varchar2(30),
	goods_price number(8),
	cost number(8),
	in_date date
)

insert into goods_tbl_002 values('110001', '라면',1050,750,'20190302');
insert into goods_tbl_002 values('110002', '빵',1300,800,'20190302');
insert into goods_tbl_002 values('110003', '과자',2000,1700,'20190302');
insert into goods_tbl_002 values('110004', '탄산음료',900,750,'20190302');
insert into goods_tbl_002 values('110005', '삼각김밥',750,300,'20190302');
insert into goods_tbl_002 values('110006', '초콜릿',1500,1300,'20190302');
insert into goods_tbl_002 values('110007', '우유',850,600,'20190302');

create table store_tbl_002(
	store_cd varchar2(5) primary key,
	store_nm varchar2(20),
	store_fg varchar2(1)
)
insert into store_tbl_002 values('A001', '이태원점','0');
insert into store_tbl_002 values('A002', '한남점','0');
insert into store_tbl_002 values('A003', '도원점','0');
insert into store_tbl_002 values('B001', '혜화점','1');
insert into store_tbl_002 values('C001', '방배점','1');
insert into store_tbl_002 values('D001', '사당점','0');
insert into store_tbl_002 values('D002', '흑석점','1');
insert into store_tbl_002 values('E001', '금호점','0');


create table sale_tbl_002(
	sale_no varchar2(4) primary key,
	sale_ymd date not null,
	sale_fg varchar2(1) not null,
	store_cd varchar2(5),
	goods_cd varchar2(6),
	sale_cnt number(3),
	pay_type varchar2(2),
	constraint salefks12 foreign key(store_cd)
		references store_tbl_002(store_cd) on delete cascade,
	constraint salefks22 foreign key (goods_cd)
		references goods_tbl_002(goods_cd) on delete cascade
)

insert into sale_tbl_002 values('0001', '20190325','1','A001','110001',2,'02');
insert into sale_tbl_002 values('0002', '20190325','1','B001','110003',2,'02');
insert into sale_tbl_002 values('0003', '20190325','1','D001','110003',1,'01');
insert into sale_tbl_002 values('0004', '20190325','1','A001','110006',5,'02');
insert into sale_tbl_002 values('0005', '20190325','1','C001','110003',2,'02');
insert into sale_tbl_002 values('0006', '20190325','2','C001','110003',2,'02');
insert into sale_tbl_002 values('0007', '20190325','1','A002','110005',4,'02');
insert into sale_tbl_002 values('0008', '20190325','1','A003','110003',4,'02');
insert into sale_tbl_002 values('0009', '20190325','1','B001','110001',2,'01');
insert into sale_tbl_002 values('0010', '20190325','1','A002','110006',1,'02');

select * from
sale_tbl_002

create sequence seq_sale3
	increment by 1
	start with 11
	maxvalue 99999
	minvalue 11
	
select lpad(seq_sale3.nextval,4,0) , to_char(sysdate, 'YYYY-mm-dd') from dual;

select seq_sale3.CURRVAL from dual

select goods_cd,goods_nm, to_char(goods_price,'l999,999,999') || '원', to_char(cost,'l999,999,999') || '원', to_char(in_date,'YYYY-mm-dd') from goods_tbl_002 order by goods_cd

select max(goods_cd)+1, to_char(sysdate, 'YYYY-mm-dd') from GOODS_TBL_002

update GOODS_TBL_002 set goods_nm=? ,goods_price=? ,cost=? where goods_cd =?

select goods_cd,goods_nm,goods_price,cost,to_char(in_date, 'YYYY-mm-dd') from goods_tbl_002 where goods_cd ='110001'
