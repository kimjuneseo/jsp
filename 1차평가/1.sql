create table EMP_TBL_202204(
	id varchar2(5) primary key,
	name varchar2(10),
	jumin varchar2(13),
	indate date,
	dept_no varchar2(3)
)
select * from EMP_TBL_202204

insert into EMP_TBL_202204 values('10001', '권사장','6501011111111','20001001','A00');
insert into EMP_TBL_202204 values('10008', '권이사','6301011111111','20100301','A00');
insert into EMP_TBL_202204 values('10002', '유부장','7201011111111','20030401','A01');
insert into EMP_TBL_202204 values('10003', '박차장','7001011111111','20030401','A01');
insert into EMP_TBL_202204 values('10005', '정과장','7101011111111','20050801','A01');

insert into EMP_TBL_202204 values('10011', '하사원','7901011111111','20170901','A01');
insert into EMP_TBL_202204 values('10012', '노사원','8001011111111','20170901','A01');
insert into EMP_TBL_202204 values('10016', '길인턴','7701011111111','20200401','A01');
insert into EMP_TBL_202204 values('10004', '김부장','7301011111111','20040401','A02');
insert into EMP_TBL_202204 values('10006', '신차장','7601011111111','20070701','A02');
insert into EMP_TBL_202204 values('10007', '조과장','7501011111111','20070701','A02');
insert into EMP_TBL_202204 values('10010', '이대리','7701011111111','20160801','A02');
insert into EMP_TBL_202204 values('10013', '유사원','7901011111111','20190501','A02');
insert into EMP_TBL_202204 values('10014', '황사원','8001011111111','20190501','A02');
insert into EMP_TBL_202204 values('10015', '오인턴','8201011111111','20200401','A02');


create table dept_tbl_202204(
	dept_no varchar2(3) primary key,
	dept_nm varchar2(20),
	leader_id varchar2(5)
)

insert into dept_tbl_202204 values('A00','경영관리팀','10001');
insert into dept_tbl_202204 values('A01','영업1팀','10002');
insert into dept_tbl_202204 values('A02','영업1팀','10004');

create table performance_tbl_202204(
	per_no number(4) primary key,
	per_ymd varchar2(8),
	per_fg char(1),
	per_amt number(10),
	id varchar2(5)
)

insert into performance_tbl_202204 values(0001, '20220325','1',3000000,'10002');
insert into performance_tbl_202204 values(0002, '20220325','1',1500000,'10004');
insert into performance_tbl_202204 values(0003, '20220326','1',500000,'10003');
insert into performance_tbl_202204 values(0004, '20220326','1',300000,'10005');
insert into performance_tbl_202204 values(0005, '20220326','1',600000,'10006');
insert into performance_tbl_202204 values(0006, '20220327','1',800000,'10013');
insert into performance_tbl_202204 values(0007, '20220327','1',200000,'10010');
insert into performance_tbl_202204 values(0008, '20220327','2',150000,'10012');
insert into performance_tbl_202204 values(0009, '20220327','1',350000,'10014');
insert into performance_tbl_202204 values(0010, '20220327','1',700000,'10015');

insert into performance_tbl_202204 values(0011, '20220425','1',900000,'10002');
insert into performance_tbl_202204 values(0012, '20220425','1',1000000,'10004');
insert into performance_tbl_202204 values(0013, '20220425','2',800000,'10003');
insert into performance_tbl_202204 values(0014, '20220426','1',400000,'10007');
insert into performance_tbl_202204 values(0015, '20220426','1',250000,'10015');
insert into performance_tbl_202204 values(0016, '20220427','2',450000,'10009');
insert into performance_tbl_202204 values(0017, '20220428','1',200000,'1001');
select * from performance_tbl_202204
drop table performance_tbl_202204

select  lpad(max(per_no) +1,4,0),et.id, name from EMP_TBL_202204 et,performance_tbl_202204 where et.id = '10001' group by et.id, name


select to_char(add_months(sysdate,-1) ,'YYYYmmdd')from dual


select per_amt from performance_tbl_202204 where per_fg ='2'

select to_char(add_months(sysdate,-1) ,'YYYY-mm') || '매출실적' cd,
	decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀'), 
	  
	case when  then to_char(sum(per_amt), '999,999,999')
		when when
from performance_tbl_202204 natural join EMP_TBL_202204 1
where per_ymd between to_char(add_months(sysdate,-1) ,'YYYYmmdd') 
	and to_char(sysdate,'YYYYmmdd') 
group by decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀')
	

select  *
from (
	select to_char(add_months(sysdate,-1) ,'YYYY-mm') || '매출실적' cd,
		decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀'), 
		to_char(sum(per_amt), '999,999,999')  
	from performance_tbl_202204 natural join EMP_TBL_202204 
	where per_ymd between to_char(add_months(sysdate,-1) ,'YYYYmmdd') 
		and to_char(sysdate,'YYYYmmdd') 
	group by decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀')
	
	union
	select to_char(add_months(sysdate,-1) ,'YYYY-mm') || '매출실적' cd,
		decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀'), 
		to_char(per_amt,'999,999,999') 
	from performance_tbl_202204 natural join EMP_TBL_202204
	where per_ymd between to_char(add_months(sysdate,-1) ,'YYYYmmdd') 
		and to_char(sysdate,'YYYYmmdd') 
	group by decode(dept_no,'A00','경영관리팀','A01','영업1팀','A02','영업2팀')
	
}
