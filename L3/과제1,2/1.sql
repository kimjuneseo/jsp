
-- 작업 1
create table reservation_tbl(
	lentno varchar2(3) primary key,
	custname varchar2(20),
	bookno varchar2(3),
	outdate date,
	indate date,
	status char(1)
)

insert into reservation_tbl values('1', '김한국','101', '20171201','', '1');
insert into reservation_tbl values('2', '진선미','102', '20171204','20171206', '2');
insert into reservation_tbl values('3', '장소미','201', '20171001','', '1');
insert into reservation_tbl values('4', '최소망','103', '20171109','', '1');
insert into reservation_tbl values('5', '이동국','301', '20171204','20171225', '2');
insert into reservation_tbl values('6', '이소라','105', '20171208','20171211', '2');

create table bookinfo_tbl(
	bookno number(4) primary key,
	author char(20),
	bookname char(20)
)

insert into  bookinfo_tbl values(101, '박작가','시스템분석');
insert into  bookinfo_tbl values(102, '김작가','전사개론');
insert into  bookinfo_tbl values(103, '이작가','마케팅개론');
insert into  bookinfo_tbl values(105, '황작가','사회학');
insert into  bookinfo_tbl values(201, '최작가','역사학');
insert into  bookinfo_tbl values(301, '오작가','전산영어');

select lentno, custname,bookname,to_char(outdate, 'yyyy-mm-dd'),nvl(to_char(indate, 'YYYY-MM-DD'), ' ')
from reservation_tbl rt
join bookinfo_tbl bt
on bt.bookno = rt.bookno

select custname, decode(status, '1','대출','2','반납')
from reservation_tbl

create table custom_01(
	p_id varchar2(10) primary key,
	p_pw varchar2(10),
	c_name varchar2(10),
	c_email varchar2(20),
	c_tel varchar2(14)
)

insert into custom_01 values('aaa','1234','김회원','aaa@korea.com','010-1111-1111');
insert into custom_01 values('bbb','1234','이회원','bbb@korea.com','010-1111-1112');
insert into custom_01 values('ccc','1234','박회원','ccc@korea.com','010-1111-1113');
insert into custom_01 values('ddd','1234','오회원','ddd@korea.com','010-1111-1114');
insert into custom_01 values('eee','1234','최회원','eee@korea.com','010-1111-1115');
insert into custom_01 values('fff','1234','조회원','fff@korea.com','010-1111-1116');

select p_id, c_name,c_email, c_tel from custom_01
