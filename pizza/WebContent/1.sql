create table TBL_PIZZA_01(
	pcode char (4) primary key,
	pname varchar2(30),
	cost number(7)
)


insert into TBL_PIZZA_01 values('AA01', '고르곤졸라피자', 6000);
insert into TBL_PIZZA_01 values('AA02', '치즈피자', 6500);
insert into TBL_PIZZA_01 values('AA03', '페러로니피자', 7000);
insert into TBL_PIZZA_01 values('AA04', '콤비네이션피자', 7500);
insert into TBL_PIZZA_01 values('AA05', '고구마피자', 6000);
insert into TBL_PIZZA_01 values('AA06', '포테이토피자', 7000);
insert into TBL_PIZZA_01 values('AA07', '불고기피자', 8000);
insert into TBL_PIZZA_01 values('AA08', '나폴리피자', 8000);

create table TBL_SHOP_01(
	scode char(4) primary key,
	sname varchar2(20)
)

insert into TBL_SHOP_01 VALUES('S001', '강남점');
insert into TBL_SHOP_01 VALUES('S002', '강서점');
insert into TBL_SHOP_01 VALUES('S003', '강동점');
insert into TBL_SHOP_01 VALUES('S004', '영동점');
insert into TBL_SHOP_01 VALUES('S005', '시청점');
insert into TBL_SHOP_01 VALUES('S006', '인천점');

create table TBL_SALELIST_01(
	saleno number (7),
	scode char(4),
	saledate date,
	pcode char(4),
	amount number(5),
	constraint salest01_pk primary key (saleno),
	constraint sale_FK1 foreign key(scode)
		references TBL_SHOP_01(scode),
	constraint sale_FK2 foreign key(pcode)
		references TBL_PIZZA_01(pcode)
)
insert into TBL_SALELIST_01 values(10001, 'S001', '2018-12-02', 'AA01', 50);
insert into TBL_SALELIST_01 values(10002, 'S001', '2018-12-02', 'AA02', 30);
insert into TBL_SALELIST_01 values(10003, 'S001', '2018-12-02', 'AA03', 20);
insert into TBL_SALELIST_01 values(10004, 'S001', '2018-12-02', 'AA04', 50);
insert into TBL_SALELIST_01 values(10005, 'S003', '2018-12-03', 'AA01', 40);
insert into TBL_SALELIST_01 values(10006, 'S003', '2018-12-03', 'AA02', 60);
insert into TBL_SALELIST_01 values(10007, 'S003', '2018-12-03', 'AA04', 60);
insert into TBL_SALELIST_01 values(10008, 'S003', '2018-12-04', 'AA05', 70);
insert into TBL_SALELIST_01 values(10009, 'S005', '2018-12-02', 'AA01', 80);
insert into TBL_SALELIST_01 values(10010, 'S005', '2018-12-02', 'AA03', 30);
insert into TBL_SALELIST_01 values (10011, 'S005', '2018-12-02', 'AA04', 40);
insert into TBL_SALELIST_01 values(10012, 'S005', '2018-12-02', 'AA05', 50);
insert into TBL_SALELIST_01 values(10013, 'S004', '2018-12-04', 'AA01', 30);
insert into TBL_SALELIST_01 values(10014, 'S004', '2018-12-04', 'AA02', 20);
insert into TBL_SALELIST_01 values(10015, 'S004', '2018-12-04', 'AA06', 50);

select * from TBL_PIZZA_01

select saleno, scode|| '-' || sname, to_char(saledate, 'YYYY-dd-mm'), st.pcode,pname,amount, to_char(amount*cost, 'l999,999,999') from TBL_SALELIST_01 st natural join TBL_SHOP_01 spt join TBL_PIZZA_01 pt on pt.pcode = st.pcode

select scode, sname,to_char(sum(ac), 'l999,999,999') sc from( select scode,amount*cost ac, sname from TBL_SALELIST_01 st natural join TBL_SHOP_01 join TBL_PIZZA_01 pt on pt.pcode = st.pcode ) where sname = sname group by sname,scode order by scode

select pcode, pname,to_char(sum(ac), 'l999,999,999') sc from( select pt.pcode, amount*cost ac, pname from TBL_SALELIST_01 st natural join TBL_SHOP_01 join TBL_PIZZA_01 pt on pt.pcode = st.pcode ) where pname = pname  group by pcode, pname  order by pcode
