create table MEM_TBL_202205(
	id number(6) primary key,
	name varchar2(10),
	jumin varchar2(13),
	indate date,
	grade varchar2(1)
)

insert into MEM_TBL_202205 values(100001, '김학생', '0501013333333','20220301','0');
insert into MEM_TBL_202205 values(100002, '이학생', '0502014444444','20220501','1');
insert into MEM_TBL_202205 values(100003, '최학생', '0503013333333','20220301','0');
insert into MEM_TBL_202205 values(100004, '박학생', '0504013333333','20220301','0');
insert into MEM_TBL_202205 values(100005, '정학생', '0505014444444','20220301','0');
insert into MEM_TBL_202205 values(100006, '신학생', '0506013333333','20220501','1');


create table ATT_TBL_202205(
	att_ymd varchar2(8),
	att_no  varchar2(3),
	att_id number(6),
	constraint Att_pk primary key (att_ymd, att_no)
)

insert into ATT_TBL_202205 values('20220502', '001', 100001);
insert into ATT_TBL_202205 values('20220502', '002', 100002);
insert into ATT_TBL_202205 values('20220502', '003', 100004);
insert into ATT_TBL_202205 values('20220503', '001', 100001);
insert into ATT_TBL_202205 values('20220503', '002', 100002);
insert into ATT_TBL_202205 values('20220503', '003', 100004);
insert into ATT_TBL_202205 values('20220503', '004', 100001);
insert into ATT_TBL_202205 values('20220503', '005', 100006);
insert into ATT_TBL_202205 values('20220504', '001', 100004);
insert into ATT_TBL_202205 values('20220505', '001', 100001);
insert into ATT_TBL_202205 values('20220505', '002', 100003);
insert into ATT_TBL_202205 values('20220505', '003', 100004);

select id, name, decode(substr(jumin,7,1), '1','남','3','남','2','여','4','여'), substr(jumin,1,6) || '-' ||substr(jumin,7,1) || '******',to_char(indate,'YYYY-MM-DD'), decode(grade,'0','정기','1','비정기') from MEM_TBL_202205 order by id

update MEM_TBL_202205 set name = ?,jumin = ?,indate=? ,grade=? where id = ?

select max(id)+1 from MEM_TBL_202205 


select id, name, gr, aa||'일 출석' from( select id, name, decode(grade,'0','정기','1','비정기') gr, (select count(*) from ATT_TBL_202205 where att_id = id) aa from MEM_TBL_202205 natural join ATT_TBL_202205  group by id, name, grade order by id) where aa != 0




decode()