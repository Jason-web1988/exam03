drop table lecturer_tbl_01;
drop table course_tbl_01;
drop sequence lecturer_seq01;

create table course_tbl_01(
	id varchar2(5) not null primary key,
	name varchar2(40),
	credit number(6),
	lecturer varchar2(10),
	week number(2),
	start_hour number(4),
	end_hour number(4)
);

create table lecturer_tbl_01(
	idx number(6) not null primary key,
	name varchar2(10),
	major varchar2(40),
	field varchar2(40)
);

insert into course_tbl_01 values('10001', '프로그래밍', 2, '1', 1, 0900, 1100);
insert into course_tbl_01 values('10002', '객체지향 프로그래밍', 2, '2', 2, 0900, 1200);
insert into course_tbl_01 values('10003', '자료구조', 3, '4', 3, 0900, 1200);
insert into course_tbl_01 values('10004', '알고리즘', 3, '4', 4, 0900, 1200);
insert into course_tbl_01 values('20001', '시스템 프로그래밍', 2, '5', 1, 1300, 1600);
insert into course_tbl_01 values('20002', '운영체제', 3, '5', 1, 1500, 1800);
insert into course_tbl_01 values('20003', '오토마타 컴파일러', 3, '5', 2, 1330, 1630);
insert into course_tbl_01 values('30003', '소프트웨어 공학', 2, '3', 3, 1330, 1530);
insert into course_tbl_01 values('30001', '시스템 분석 및 설계', 3, '3', 4, 0900, 1200);
insert into course_tbl_01 values('40001', '데이터베이스', 3, '2', 5, 1300, 1600);

create sequence lecturer_seq01
start with 1
increment by 1
minvalue 1;

insert into lecturer_tbl_01 values(lecturer_seq01.nextval, '김교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl_01 values(lecturer_seq01.nextval, '이교수', '소프트웨어공학', '인공지능');
insert into lecturer_tbl_01 values(lecturer_seq01.nextval, '박교수', '소프트웨어공학', '소프트웨어공학');
insert into lecturer_tbl_01 values(lecturer_seq01.nextval, '우교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl_01 values(lecturer_seq01.nextval, '최교수', '응용컴퓨터공학', '임베디드 시스템');
insert into lecturer_tbl_01 values(lecturer_seq01.nextval, '강교수', '응용컴퓨터공학', '멀티미디어');
insert into lecturer_tbl_01 values(lecturer_seq01.nextval, '황교수', '모바일시스템공학', '네트워크');

select id, name, credit, lecturer, week, start_hour, end_hour from course_tbl_01 order by id asc;
select count(id) from course_tbl_01;

select idx, name, major, field from lecturer_tbl_01;