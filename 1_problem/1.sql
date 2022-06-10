create table TBL_ENTRY_202104(
	ENTRY_ID char(4) primary key,
	ENTRY_NAME varchar2(20),
	ENTRY_BIRTH varchar2(8),
	ENTRY_GENDER char(1),
	TALENT char(1),
	NATIVE varchar2(10)
)
select * from TBL_ENTRY_202104 where ENTRY_ID = 'A001';

insert into TBL_ENTRY_202104 values('A001','김가수','20020101','M','1','서울');
insert into TBL_ENTRY_202104 values('A002','이가수','19980201','M','2','경기');
insert into TBL_ENTRY_202104 values('A003','최가수','20010301','F','3','강원');
insert into TBL_ENTRY_202104 values('A004','정가수','20040401','F','1','경상');
insert into TBL_ENTRY_202104 values('A005','박가수','20030501','M','2','전라');

create table TBL_SCORE_202104(
	score_no varchar2(3) primary key,
	score_fg char(1),
	entry_id char(4),
	score number(3)
)

insert into tbl_score_202104 values('001', '1', 'A001', 92);
insert into tbl_score_202104 values('002', '1', 'A002', 81);
insert into tbl_score_202104 values('003', '1', 'A003', 90);
insert into tbl_score_202104 values('004', '1', 'A004', 77);
insert into tbl_score_202104 values('005', '1', 'A005', 84);
insert into tbl_score_202104 values('006', '2', 'A001', 86);
insert into tbl_score_202104 values('007', '2', 'A002', 76);
insert into tbl_score_202104 values('008', '2', 'A003', 94);
insert into tbl_score_202104 values('009', '2', 'A004', 80);
insert into tbl_score_202104 values('010', '2', 'A005', 86);

select ENTRY_ID,ENTRY_NAME, substr(ENTRY_BIRTH,1,4) || '-' || substr(ENTRY_BIRTH, 5,2) || '-' || substr(ENTRY_BIRTH,7,8), decode(ENTRY_GENDER, 'M', '남자','F', '여자'), decode(TALENT, '1','보컬', '2','댄스','3','랩'),NATIVE from TBL_ENTRY_202104


select score_no, ENTRY_ID,ENTRY_NAME, substr(ENTRY_BIRTH,1,4) || '월' || substr(ENTRY_BIRTH, 5,2) || '일' || substr(ENTRY_BIRTH,7,8), decode(SCORE_FG, '1', '일반인 평가', '2','전문가평가'),score, case when score >= 90 then 'A' when score >= 80 then 'B' when score >= 70 then 'C' else 'D' end from tbl_score_202104 natural join TBL_ENTRY_202104


select ENTRY_ID,ENTRY_NAME,sum_score,ROUND(sum_score/2,1 ),rank() over(order by sum_score desc) from(  select ENTRY_ID,ENTRY_NAME,sum(score) sum_score from tbl_score_202104 natural join TBL_ENTRY_202104 group by ENTRY_ID,ENTRY_NAME)


-- 참가번호가 같은거는 그룹핑 
-- 
