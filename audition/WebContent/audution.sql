create table TBL_ARTIST_201905(
	ARTIST_ID char(4) primary key,
	ARTIST_ANEM varchar2(20),
	ARTIST_BIRTH char(8),
	ARTIST_GENDER char(1),
	TALENT char(1),
	AGENCY varchar2(30)
)

alter table TBL_ARTIST_201905 RENAME COLUMN ARTIST_ANEM to ARTIST_NAME

insert into TBL_ARTIST_201905 VALUES('A001' ,'김스타', '19970101' ,'F', '1', 'A엔터테이먼트');
insert into TBL_ARTIST_201905 VALUES('A002' ,'조스타', '19980201' ,'M', '2', 'B엔터테이먼트');
insert into TBL_ARTIST_201905 VALUES('A003' ,'왕스타', '19990301' ,'M', '3', 'C엔터테이먼트');
insert into TBL_ARTIST_201905 VALUES('A004' ,'정스타', '20000401' ,'M', '1', 'D엔터테이먼트');
insert into TBL_ARTIST_201905 VALUES('A005' ,'홍스타', '20010501' ,'F', '2', 'E엔터테이먼트');

select * from TBL_ARTIST_201905

create table TBL_MENTO_201905(
	MENTO_ID char(4) primary key,
	MEMTO_NAME varchar2(40)
)

insert into TBL_MENTO_201905 VALUES('J001', '황멘토');
insert into TBL_MENTO_201905 VALUES('J002', '박멘토');
insert into TBL_MENTO_201905 VALUES('J003', '장멘토');

create table TBL_POINT_201905(
	SERIAL_NO varchar2(8) primary key,
	ARTIST_ID char(4),
	MENTO_ID char(4),
	POINT number(3)
)

insert into TBL_POINT_201905 VALUES('20190001', 'A001', 'J001', 78);
insert into TBL_POINT_201905 VALUES('20190002', 'A001', 'J002', 76);
insert into TBL_POINT_201905 VALUES('20190003', 'A001', 'J003', 70);
insert into TBL_POINT_201905 VALUES('20190004', 'A002', 'J001', 80);
insert into TBL_POINT_201905 VALUES('20190005', 'A002', 'J002', 72);
insert into TBL_POINT_201905 VALUES('20190006', 'A002', 'J003', 78);
insert into TBL_POINT_201905 VALUES('20190007', 'A003', 'J001', 90);
insert into TBL_POINT_201905 VALUES('20190008', 'A003', 'J002', 92);
insert into TBL_POINT_201905 VALUES('20190009', 'A003', 'J003', 88);
insert into TBL_POINT_201905 VALUES('20190010', 'A004', 'J001', 96);
insert into TBL_POINT_201905 VALUES('20190011', 'A004', 'J002', 90);
insert into TBL_POINT_201905 VALUES('20190012', 'A004', 'J003', 98);
insert into TBL_POINT_201905 VALUES('20100013', 'A005', 'J001', 88);
insert into TBL_POINT_201905 VALUES('20190014', 'A005', 'J002', 86);
insert into TBL_POINT_201905 VALUES('20190015', 'A005', 'J003', 86);

update TBL_POINT_201905 set SERIAL_NO = '20190013' where SERIAL_NO = '20100013'

COLUMN
alter table TBL_MENTO_201905 rename column memto_name to mento_name

select * from TBL_POINT_201905


select artist_id, artist_name, SUBSTR(artist_birth, 1,4)||'년'||SUBSTR(artist_birth, 5, 2)||'월'||SUBSTR(artist_birth, 7,2)||'일' artist_birth ,decode(ARTIST_GENDER, 'M', '남자','F','여자'), decode(talent, '1','보컬','2','댄스','3','랩'),agency from tbl_artist_201905 order by artist_id asc

select  to_char(to_date(artist_birth), 'YYYY"년"mm"월"dd"일"') from tbl_artist_201905;

select serial_no, ta.artist_id, 
	   artist_name, 
	   to_char(to_date(artist_birth), 'YYYY"년"mm"월"dd"일"'), 
	   point,
	   case when point >= 90 then 'A'
	   	 when point >= 80 then 'B'
	   	 when point >= 70 then 'C'
	  else 'D'
	  end as cs_grade,
	   '' grade, 
	   tm.mento_name
 from TBL_POINT_201905 TP, TBL_ARTIST_201905 TA, TBL_MENTO_201905 TM
 where tp.artist_id = ta.artist_id


 -- 참가등수조회 : 참가번호, 참가자명, 총점, 평균, 등수
 
 select ta.artist_id, tp.artist_name sum(point), avg(point), '' RK
 	from TBL_POINT_201905 TP, TBL_ARTIST_201905 TA
 where tp.artist_id = ta.artist_name
 group by artist_id, artist_name
 
 
 
 -- 멘토점수조희
 select SERIAL_NO, ta.artist_id, artist_name, 
 	substr(artist_birth, 1,4) || '년' ||
 	substr(artist_birth, 5,2) || '월' ||
 	substr(artist_birth, 7,2) || '일' as artist_birth,
 	point,
 	case when point >= 90 then 'A'
 	  when point >= 80 then 'B'
 	  when point >= 70 then 'C'
 	else 'E'
 	end as grade,
 	mento_name 
 from TBL_POINT_201905 tp, tbl_artist_201905 ta,tbl_mento_201905 tm
 where tp.artist_id = ta.artist_id
 and  tp.mento_id = tm.mento_id
 order by serial_no 
 
❤
 -- 참가자 등수 조회
 select ta.artist_id, artist_name, sum(point) sum_p, round(avg(point), 2) avg_p,rank() over(order by avg(point) desc) r_num
 from tbl_artist_201905 ta, tbl_point_201905 tp
 where ta.artist_id = tp.artist_id
 group by ta.artist_id, artist_name
 order by sum_p desc
 
 select ta.artist_id, artist_name, sum(point) sum_p, round(avg(point), 2) avg_p,rank() over(order by avg(point) desc) r_num from tbl_artist_201905 ta, tbl_point_201905 tp where ta.artist_id = tp.artist_id group by ta.artist_id, artist_name order by sum_p desc
 
 
 