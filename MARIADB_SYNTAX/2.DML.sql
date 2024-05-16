-- insert into : 데이터 삽입
insert into 테이블명(컬럼1, 컬럼2, 컬럼3) values(데이터1, 데이터2, 데이터3)
-- id, name, email -> author 1건 추가

--id, title, content, author_id ->posts에 1건 추가
insert into posts(id, title, content, author_id) values(1,'안녕하세요', '내용입니다.', '1');

--테이블 제약조건 조회
select * from information_schema.key_column_usage where table_name = 'posts';