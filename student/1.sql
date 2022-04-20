create table student_tbl_004(
    st_no varchar2(6) primary key,
    st_major varchar2(30) not null,
    st_nm varchar2(10) not null,
    st_addr varchar2(50),
    st_phone varchar2(11),
    st_email varchar2(20),
    st_in_date date,
    st_out_date varchar2(30)
)

insert into student_tbl_004 (st_no, st_major, st_nm, st_addr, st_phone, st_email, st_in_date) values('30501', '유비쿼터스', '강신일', '서울시 송파구', '01011112222', 'ksj@sdhs.kr','20170302');
insert into student_tbl_004 (st_no, st_major, st_nm, st_addr, st_phone, st_email, st_in_date) values('30502', '유비쿼터스', '김병철', '서울시 강남구', '01022223333', 'kbc@sdhs.kr','20170302');
insert into student_tbl_004 (st_no, st_major, st_nm, st_addr, st_phone, st_email, st_in_date) values('30503', '유비쿼터스', '김지원', '서울시 송파구', '01033334444', 'kjw@sdhs.kr','20170302');
insert into student_tbl_004 (st_no, st_major, st_nm, st_addr, st_phone, st_email, st_in_date) values('30504', '유비쿼터스', '박훈', '서울시 성동구',   '01044445555', 'bh@sdhs.kr','20170302');
insert into student_tbl_004 (st_no, st_major, st_nm, st_addr, st_phone, st_email, st_in_date) values('30505', '유비쿼터스', '송중기', '서울시 동작구', '01055556666', 'sjk@sdhs.kr','20170302');
insert into student_tbl_004 (st_no, st_major, st_nm, st_addr, st_phone, st_email, st_in_date) values('30506', '유비쿼터스', '송혜교', '서울시 용산구', '01066667777', 'shk@sdhs.kr','20170302');
insert into student_tbl_004 (st_no, st_major, st_nm, st_addr, st_phone, st_email, st_in_date) values('30507', '유비쿼터스', '진수', '서울시 광진구', '01077778888', 'jg@sdhs.kr','20170302');

create table subject_tbl_004(
    sbj_cd varchar2(8) primary key,
    sbj_nm varchar2(20),
    sbj_fg varchar2(2)
)

insert into subject_tbl_004 values('A001', 'HTML', 'Y');
insert into subject_tbl_004 values('A002', 'JAVA', 'Y');
insert into subject_tbl_004 values('A003', 'PHP', 'Y');
insert into subject_tbl_004 values('A004', 'JAVASCRIPT', 'Y');
insert into subject_tbl_004 values('A005', 'CSS', 'Y');
insert into subject_tbl_004 values('B001', '국어', 'N');
insert into subject_tbl_004 values('B002', '영어', 'N');
insert into subject_tbl_004 values('B003', '수학', 'N');

create table exam_tbl_004(
    exam_ymd varchar2(8) ,
    exam_no varchar2(5) ,
    exam_st_no varchar2(6),
    exam_sbj_cd varchar2(6),
    exam_w_point number(3),
    exam_a_point number(3),
    constraint exam_pk primary key (exam_ymd, exam_no),
    constraint exam_fk foreign key (exam_st_no)
	--부모테이블 값이 삭제되면 연쇄적으로 자식 테이블 값도 지워짐
    --on delete cascade없으면 안 지워짐 참조되는 부모 테이블의 행에 대한 delect를 허용한다는 것
    	references student_tbl_004(st_no) on delete cascade,
    constraint exam_fk2 foreign key (exam_sbj_cd)
    	references subject_tbl_004(sbj_cd) on delete cascade
)

drop table exam_tbl_004

insert into EXAM_TBL_004 values('20190412', '0001', '30501', 'A001', 80, 60);
insert into EXAM_TBL_004 values('20190412', '0002', '30502', 'A001', 70, 80);
insert into EXAM_TBL_004 values('20190412', '0003', '30503', 'A001', 90, 85);
insert into EXAM_TBL_004 values('20190412', '0004', '30504', 'A001', 100, 95);
insert into EXAM_TBL_004 values('20190412', '0005', '30505', 'A001', 65, 75);
insert into EXAM_TBL_004 values('20190412', '0006', '30506', 'A001', 50, 65);
insert into EXAM_TBL_004 values('20190412', '0007', '30507', 'A001', 80, 85);
insert into EXAM_TBL_004 values('20190412', '0008', '30501', 'B002', 70, 50);
insert into EXAM_TBL_004 values('20190412', '0009', '30502', 'B002', 70, 70);
insert into EXAM_TBL_004 values('20190412', '0010', '30503', 'B002', 80, 65);
insert into EXAM_TBL_004 values('20190412', '0011', '30504', 'B002', 80, 95);
insert into EXAM_TBL_004 values('20190412', '0012', '30505', 'B002', 65, 70);
insert into EXAM_TBL_004 values('20190412', '0013', '30506', 'B002', 55, 75);
insert into EXAM_TBL_004 values('20190412', '0014', '30507', 'B002', 80, 85);

create table person_tbl_004(
	p_no varchar2(10),
	p_nm varchar2(10),
	p_age varchar2(10)
)

-- 2
create sequence student_number
	start with 8 increment by 1
create sequence exam_sample
	start with 100 increment by 1
	
-- 2-1
select exam_sample.nextval from dual;

-- 2-2
select exam_sample.currval from dual; 

-- 3
-- 더블 쿼터이션으로  출력해야 공백과 특수문자 출력가능 한글도
select to_char(sysdate, 'YYYY-DD-MM') as "오늘의 날짜" from dual; 

-- 4
-- 공백하나라도 넣어줘야 됨
select 
	substr(st_no, 1,1) as "학년", substr(st_no, 3,1) as "반 ", substr(st_no, 5,1) as "번호",
	st_major as "전공",
	st_nm as "이름",
	' ' as "출석"
from student_tbl_004 

-- 5
select
	st_no as "학번", 
	st_nm  as "성명",
	st_major as "전공", 
	exam_w_point || '점' as "필기평가" ,
	exam_a_point || '점' as "실기평가",
	sum(exam_w_point + exam_a_point)/2 || '점'  as "평균",
	case when sum(exam_w_point + exam_a_point)/2 >= 90 then 'A'
	when sum(exam_w_point + exam_a_point)/2 >= 80 and sum(exam_w_point + exam_a_point)/2 < 90  then 'B'
		 when sum(exam_w_point + exam_a_point)/2 >= 70 and sum(exam_w_point + exam_a_point)/2 < 80  then 'C'
		 when sum(exam_w_point + exam_a_point)/2 >= 60 and sum(exam_w_point + exam_a_point)/2 < 70  then 'D'
	else 'E' end as "등급"
from exam_tbl_004, student_tbl_004
where exam_st_no = st_no
and exam_sbj_cd = 'A001'
group by st_no,st_nm,st_major,exam_w_point,exam_a_point
order by st_no

-- 5-1
select
	st_no as "학번", 
	st_nm  as "성명",
	st_major as "전공", 
	exam_w_point || '점' as "필기평가" ,
	exam_a_point || '점' as "실기평가",
	round(sum(exam_w_point + exam_a_point)/2,0) || '점'  as "평균",
	case when sum(exam_w_point + exam_a_point)/2 >= 90 then 'A'
	when sum(exam_w_point + exam_a_point)/2 >= 80 and sum(exam_w_point + exam_a_point)/2 < 90  then 'B'
		 when sum(exam_w_point + exam_a_point)/2 >= 70 and sum(exam_w_point + exam_a_point)/2 < 80  then 'C'
		 when sum(exam_w_point + exam_a_point)/2 >= 60 and sum(exam_w_point + exam_a_point)/2 < 70  then 'D'
	else 'F' end as "등급"
from exam_tbl_004, student_tbl_004
where exam_st_no = st_no
and exam_sbj_cd = 'A001'
group by st_no,st_nm,st_major,exam_w_point,exam_a_point
order by st_no

-- 5-2
select
	st_no as "학번", 
	st_nm  as "성명",
	st_major as "전공", 
	exam_w_point || '점' as "필기평가" ,
	exam_a_point || '점' as "실기평가",
	sum(exam_w_point + exam_a_point)/2 || '점'  as "평균",
	case when sum(exam_w_point + exam_a_point)/2 >= 90 then 'A'
	when sum(exam_w_point + exam_a_point)/2 >= 80 and sum(exam_w_point + exam_a_point)/2 < 90  then 'B'
		 when sum(exam_w_point + exam_a_point)/2 >= 70 and sum(exam_w_point + exam_a_point)/2 < 80  then 'C'
		 when sum(exam_w_point + exam_a_point)/2 >= 60 and sum(exam_w_point + exam_a_point)/2 < 70  then 'D'
	else 'F' end as "등급"
from exam_tbl_004, student_tbl_004
where exam_st_no = st_no
and exam_sbj_cd = 'A001'
group by st_no,st_nm,st_major,exam_w_point,exam_a_point
order by sum(exam_w_point + exam_a_point)/2 desc

-- 5-3
select
	st_no as "학번", 
	st_nm  as "성명",
	case when sum(exam_w_point + exam_a_point)/2 >= 90 then 'A'
		when sum(exam_w_point + exam_a_point)/2 >= 80 and sum(exam_w_point + exam_a_point)/2 < 90  then 'B'
		 when sum(exam_w_point + exam_a_point)/2 >= 70 and sum(exam_w_point + exam_a_point)/2 < 80  then 'C'
		 when sum(exam_w_point + exam_a_point)/2 >= 60 and sum(exam_w_point + exam_a_point)/2 < 70  then 'D'
	else 'F' end as "등급"
from exam_tbl_004, student_tbl_004
where exam_st_no = st_no
and exam_sbj_cd = 'A001'
group by st_no,st_nm,exam_w_point,exam_a_point
having  sum(exam_w_point + exam_a_point)/2 >= 80 and sum(exam_w_point + exam_a_point)/2 < 90   
order by sum(exam_w_point + exam_a_point)/2 desc

-- 5-4
select * from(
	select 
	rank() over(order by sum(exam_w_point + exam_a_point)/2 desc) as "순위",
	exam_st_no as "학번",
	st_nm as "성명",
	st_major as "전공",
	sum(exam_w_point + exam_a_point)/2 as "평균"
	from exam_tbl_004, student_tbl_004
	where exam_st_no = st_no
	and exam_sbj_cd = 'A001'
	group by exam_st_no,st_nm,st_major,exam_w_point,exam_a_point
	)
	where "순위" <= 3
