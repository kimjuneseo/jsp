create table goods_tbl_003(
	goods_cd varchar2(6) primary key,
	goods_nm varchar2(30),
	goods_price number(8),
	cost number(8),
	in_date date
)

insert into goods_tbl_003 values('110001','라면', 1050,750,'20190302');
insert into goods_tbl_003 values('110002','빵', 1300,800,'20190302');
insert into goods_tbl_003 values('110003','과자', 2000,1700,'20190302');
insert into goods_tbl_003 values('110004','탄산음료', 900,750,'20190302');
insert into goods_tbl_003 values('110005','삼각김밥', 750, 300, '20190302');
insert into goods_tbl_003 values('110006','초콜릿', 1500,1300,'20190302');
insert into goods_tbl_003 values('110007','우유', 850,60,'20190302');



create table store_tbl_003(
	store_cd varchar2(5) primary key,
	store_nm varchar2(50),
	store_fg varchar2(1)
)

insert into STORE_TBL_003 values('A001', '이태원점', '0');
insert into STORE_TBL_003 values('A002', '한남점', '0');
insert into STORE_TBL_003 values('A003', '도원점', '0');
insert into STORE_TBL_003 values('B001', '혜화점', '1');
insert into STORE_TBL_003 values('C001', '방배점', '1');
insert into STORE_TBL_003 values('D001', '사당점', '0');
insert into STORE_TBL_003 values('D002', '흑석점', '1');
insert into STORE_TBL_003 values('E001', '금호점', '0');

create table sale_tbl_003(
	sale_no varchar2(4) primary key,
	sale_ymd date not null,
	sale_fg varchar2(1),
	store_cd varchar2(5),
	goods_cd varchar2(6),
	sale_cnt number(3),
	pay_type varchar2(2),
	constraint sale_fk foreign key(store_cd)
		references store_tbl_003(store_cd) on delete cascade,
	constraint stle_fk2 foreign key (goods_cd)
		references goods_tbl_003(goods_cd) on delete cascade
)

insert into sale_tbl_003 values('0001', '20190325', '1', 'A001', '110001', 2, '02');
insert into sale_tbl_003 values('0002', '20190325', '1', 'B001', '110003', 2, '02');
insert into sale_tbl_003 values('0003', '20190325', '1', 'D001', '110003', 1, '01');
insert into sale_tbl_003 values('0004', '20190325', '1', 'A001', '110006', 5, '02');
insert into sale_tbl_003 values('0005', '20190325', '1', 'C001', '110003', 2, '02');
insert into sale_tbl_003 values('0006', '20190325', '2', 'C001', '110003', 2, '02');
insert into sale_tbl_003 values('0007', '20190325', '1', 'A002', '110005', 4, '02');
insert into sale_tbl_003 values('0008', '20190325', '1', 'A003', '110004', 4, '02');
insert into sale_tbl_003 values('0009', '20190325', '1', 'B001', '110001', 2, '01');
insert into sale_tbl_003 values('0010', '20190325', '1', 'A002', '110006', 1, '02');

select to_char(sysdate, 'YYYY-mm-dd'),lpad(sale_sq.nextval, 4, '0') from dual


create sequence sale_sq 
	start with 0011
	increment by 1;
	
					--  몇개 뽑  나머지는 0으로
select lpad(sale_sq.nextval, 4, '0') from dual

select goods_cd, goods_nm, to_char(goods_price, 'l999,999,999'),to_char(cost, 'l999,999,999'), in_date from goods_tbl_003

select goods_cd, goods_nm, goods_price,cost, to_char(in_date,'YYYY-dd-mm')from goods_tbl_003

select goods_cd, goods_nm, goods_price,cost, to_char(in_date,'YYYY-dd-mm')from goods_tbl_003 where goods_cd= '110001'

update goods_tbl_003 set goods_nm='빵',goods_price =123, cost = 123 where goods_cd = '110001'

select to_char(sysdate, 'YYYY-dd-mm'), max(goods_cd) +1 from GOODS_TBL_003


select store_nm, to_char(sum(cash), '999,999,999')|| '원', to_char(sum(card), '999,999,999') || '원',to_char(sum(cash+card), '999,999,999')|| '원'
from ( 
select store_nm, goods_price * sale_cnt cash, 0 card
from STORE_TBL_003 natural join goods_tbl_003 natural join sale_tbl_003
where pay_type = '01'
union 
select store_nm, 0 cash, sum(goods_price * sale_cnt) card
from STORE_TBL_003 natural join goods_tbl_003 natural join sale_tbl_003
where pay_type = '02'
group by store_nm

)
group by store_nm
order by  sum(card) desc



select store_nm, to_char(sum(cash), '999,999,999')|| '원', to_char(sum(card), '999,999,999') || '원',to_char(sum(cash+card), '999,999,999')|| '원' from (  select store_nm, goods_price * sale_cnt cash, 0 card from STORE_TBL_003 natural join goods_tbl_003 natural join sale_tbl_003 where pay_type = '01' union  select store_nm, 0 cash, sum(goods_price * sale_cnt) card from STORE_TBL_003 natural join goods_tbl_003 natural join sale_tbl_003 where pay_type = '02' group by store_nm ) group by store_nm order by  sum(card) desc




select store_cd, pay_type
-- 점포명, 현금매출, 카드매출, 총매출



select * from goods_tbl_003

select * from STORE_TBL_003

select * from SALE_TBL_003

select 
	st.store_nm,
	

from SALE_TBL_003 sa natural join goods_tbl_003 gt natural join store_tbl_003 st


select decode(sa.sale_fg, '1', '판매', '2','판매취소'), sa.sale_no, to_char(sa.sale_ymd, 'YYYY-mm-dd'), gt.goods_nm,sa.sale_cnt, sa.sale_cnt * gt.goods_price || '원', decode(pay_type, '01', '현금', '02', '카드') from SALE_TBL_003 sa natural join goods_tbl_003 gt natural join store_tbl_003 st where st.store_nm = '이태원점'



