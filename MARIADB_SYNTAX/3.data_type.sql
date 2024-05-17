-- tinyint 는 -129 ~ 127까지 포함
-- author 테이블에 age 컬럼 추가.\
alter table author add column age tinyint;

--insert 시에 age : 200
--125 초과 입력시 에러
insert into author(id, name, email,age) values(6,'ㅂㅂ','ㅇㅇ',200);
--125 이하시 정상 입력
insert into author(id, name, email,age) values(6,'ㅂㅂ','ㅇㅇ',125);
--unsigned 시에 음수를 제한함으로써  양수 255 까지 표현범위 확대
alter table author modify column age tinyint unsigned;
insert into author(id, name, email,age) values(7,'ㅂㅂ','ㅇㅇ',200);

-- decimal 실습
alter table post add column price decimal(10,3);

--decimal 소수점 초과값 입력후 짤림 ghkrdls
insert into post(id,title,price) values(7,"HELLO",3.123123);
-- update : price를 1234.1
update post set price = 1234.1 where id = 7; 

-- blob 바이너리데이터 실습
-- author테이블에 profile_image 컬럼을 blob 형식으로 추가
alter table post add column profile_image longblob;
insert into author(id, email,profile_image) values (8, 'abc@naver.com',"경로");

-- enum :삽입될수 있는 데이터 종류를 한정시킬수 있음;
--role 컬럼
alter table author add column role enum('user','admin') not null;

--user1(enum에 지정하지 않은 값) 을 insert => 에장
insert into author(id, email, role) values (9,'acs@google.com','user1');

--user 또는 admin insert => 정상
insert into author(id, email, role) values (9,'acs@google.com','admin');

--date 타입
--author 테이블에 bitrh_day 컬럼 을 date로 추가
--날짜타입의 insert는 문자열 형식으로 insert
alter table author add column date date;
insert into author(id, email, date) values(10,'test@gmail.com','2023-11-01');

-- author, post 둘다 datetime 으로 created_time 컬럼 추가
alter table author add column created_time datetime DEFAULT current_timestamp;
alter table author modify column created_time datetime DEFAULT current_timestamp;
alter table post add column created_time datetime;

insert into author(id, email) values(12,'geaeg@gmakle.com')
insert into post(id,content,created_time) values(8,'내용입니다.', '2000-11-01 12:00:56')

--비교 연산자
--and 또는 &&
select * from author where id >=1 and id <=2;
select * from author where id between 1 and 2;
-- or 또는 ||
-- NOT 또는 !
select * from post where !(id < 2 or id > 4);

--NULL인지 아닌지
select * from post where content is null;
select * from post where content is not null;
-- in(리스트 형태), not in(리스트 형태)
select * from post where id in(1,2,3,4);
select * from post where id not in(1,2,3,4);

-- like : 특정 문자를 포함하는 데이터를 조회하기 위해 사용되는 키워드
select * from post where title like "%o"; -- o로 끝나는 title 검색
select * from post where title like "h&"; -- h로 시작하는 title 검색
select * from post where title like '%llo%' --단어의 중간에 llo라는 키워드가있는 경우 탐색
select * from post where title not like "%llo%"

-- ifnull(a,b): 만약에 a가 null이면 b반환, null이 아니면 a반환
select title, content, ifnull(author_id,"익명") as 저자 

--경기도에 위치한 식품창고 목록 출력하기

--REGEXP : 정규표현식을 활용한 조회
select * from author where name REGEXP '[가-힇]';

--날짜변환 : 숫자 -> 날짜, 날짜 -> 숫자
--CAST와 CONVERT가 있다.
select CAST(20200101 as DATE);
select CAST('20200101' as DATE);
select CAST(20200101 , DATE);
select CAST('20200101', DATE);

-- datetime 조회방법
select * from post where created_time like '2024-05%';
select * from post where created_time <= '2024-12-31' and created_time >= '1999-01-01';
select * from post where created_time between '2024-12-31' and '1999-01-01';

--date_format
select date_format(created_time, '%Y-%m') from post;

-- 실습 : post를 조회할때 date_format 을 활영하여 2024데이터 조회, 결과는 *;
select * from post where date_format(created_time, "%Y") = '2024';

-- 오늘 날짜
select now();
select date_format( now(), );