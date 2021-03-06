create table tbl_jumin_201808(
	jumin char(14) primary key,
	pname varchar2(16),
	tel varchar2(13),
	address varchar2(10)
)

insert into tbl_jumin_201808 values('700101-1000001','���ֹ�','010-1234-0001','����');

insert into tbl_jumin_201808 values('700101-2000002','���ֹ�','010-1234-0002','����');
insert into tbl_jumin_201808 values('700101-1000003','���ֹ�','010-1234-0003','����');
insert into tbl_jumin_201808 values('700101-2000004','���ֹ�','010-1234-0004','����');
insert into tbl_jumin_201808 values('700101-1000005','ȫ�ֹ�','010-1234-0005','����');
insert into tbl_jumin_201808 values('700101-2000006','���ֹ�','010-1234-0006','�뱸');
insert into tbl_jumin_201808 values('700101-1000007','Ȳ�ֹ�','010-1234-0007','�뱸');
insert into tbl_jumin_201808 values('700101-2000008','���ֹ�','010-1234-0008','����');
insert into tbl_jumin_201808 values('700101-1000009','���ֹ�','010-1234-0009','����');
insert into tbl_jumin_201808 values('700101-2000010','���ֹ�','010-1234-0010','����');

create table tbl_hosp_202108(
	HOSPCODE CHAR(4) PRIMARY KEY,
	HOSPNAME VARCHAR2(10),
	HOSPTEL VARCHAR2(10),
	HOSPADDR VARCHAR2(10)	
)

INSERT INTO TBL_HOSP_202108 VALUES('H001','��-����','1588-0001','����');
INSERT INTO TBL_HOSP_202108 VALUES('H002','��-����','1588-0002','����');
INSERT INTO TBL_HOSP_202108 VALUES('H003','��-����','1588-0003','�뱸');
INSERT INTO TBL_HOSP_202108 VALUES('H004','��-����','1588-0004','����');

CREATE TABLE TBL_VACCRESV_202108(
	RESVNO CHAR(8) PRIMARY KEY,
	JUMIN CHAR(14),
	VCODE CHAR(4),
	HOSPCODE CHAR(4),
	RESVDATE CHAR(8),
	RESVTIME CHAR(4)
)
INSERT INTO TBL_VACCRESV_202108 VALUES(?,?,?,?,?,?);

INSERT INTO TBL_VACCRESV_202108 VALUES('20210001', '700101-1000001','V001','H001','20210901','0920');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210002', '700101-2000002','V001','H002','20210901','1030');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210003', '700101-1000003','V002','H003','20210901','1130');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210004', '700101-2000004','V002','H001','20210901','1230');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210005', '700101-1000005','V003','H002','20210901','1330');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210006', '700101-2000006','V003','H003','20210901','1430');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210007', '700101-1000007','V003','H001','20210901','1530');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210008', '700101-2000008','V003','H002','20210901','1630');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210009', '700101-1000009','V003','H003','20210901','1730');
INSERT INTO TBL_VACCRESV_202108 VALUES('20210010', '700101-2000010','V003','H001','20210901','1830');


select * from tbl_jumin_201808

select * from TBL_VACCRESV_202108 tv

select pname, jumin, decode(substr(jumin,8,1), '1', '남자','2','여자'), tel, substr(RESVDATE,1,4) || '년' || substr(RESVDATE,5,2) || '월' || substr(RESVDATE,7,2) || '일', substr(RESVTIME,1,2) || '-' || substr(RESVTIME,3,2), HOSPNAME,HOSPTEL,HOSPADDR, decode(VCODE,'V001','A백신','V002','B백신','V003','C백신') from tbl_jumin_201808 tj natural join TBL_VACCRESV_202108 tv join  tbl_hosp_202108 tp on tv.HOSPCODE = tp.HOSPCODE where RESVNO= '20210001'

select HOSPCODE, HOSPNAME, count(*) from tbl_hosp_202108 th natural join TBL_VACCRESV_202108 tv group by HOSPCODE,HOSPNAME order by HOSPCODE asc

select hc, hn,c from( select HOSPCODE hc, HOSPNAME hn, count(*)  c from tbl_hosp_202108 th natural join TBL_VACCRESV_202108 tv  group by HOSPCODE,HOSPNAME  union all select  ' ' hc, '총 누계' hn, count(*) c from tbl_hosp_202108 th natural join TBL_VACCRESV_202108 tv  ) order by hn asc


