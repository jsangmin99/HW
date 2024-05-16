-- insert into : 데이터 삽입
insert into 테이블명(컬럼1, 컬럼2, 컬럼3) values(데이터1, 데이터2, 데이터3)
-- id, name, email -> author 1건 추가

--id, title, content, author_id ->posts에 1건 추가
insert into posts(id, title, content, author_id) values(1,'안녕하세요', '내용입니다.', '1');

--테이블 제약조건 조회
select * from information_schema.key_column_usage where table_name = 'posts';

--테이블 생성 조회
show create table posts

-- 테이블 index 변경 조회
show index from author

밋ㄷㄱ문 : 테이블의 구조를 변경
-- 테이블 이름을 변경
alter table posts rename post

-- 테이블 컬럼 추가
alter table author add column test1 varchar(50);

--테이블 컬럼 삭제
alter table author drop column test1;

--테이블 컬럼명 변경
alter table post change column content contents varchar(255);
-- 테이블 컬럼 타입과 제약조건 변경
alter table author modify column email varchar(255) not null;

--실습1. althor 테이블에 adress 컬럼 
alter table author add column adress varchar(255);
--실습2: post테이블 title은 not null 제약조선추가
--      contents 는 3000자로 변경
alter table post modify column title varchar(3000) not null;

--명령어 보기
show create table post;
-- 임시저장
CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `contents` varchar(3000) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
)
-- 테이블 삭제
drop 테이블명

--insert 문을 통해 author 데이터 4개정도 추가, post도 5개 1개는 익명
insert into author(id,name,email,password, adress) values (2,'2번유저', '222@email.com', "qqq", "주소1");
insert into author(id,name,email,password, adress) values (3,'3번유저', '33@email.com', "qwqe", "주소2");
insert into author(id,name,email,password, adress) values (4,'4번유저', '444@email.com', "qer", "주소3");
insert into author(id,name,email,password, adress) values (5,'5번유저', '55@email.com', "qqfads", "주소4");
insert into post(id,title,contents,author_id) values (2,'제목2', '내용222222222', 2);
insert into post(id,title,contents,author_id) values (3,'제목333', '내용333333', 3);
insert into post(id,title,contents,author_id) values (4,'제444', '내용44444444444', 4);
insert into post(id,title,contents,author_id) values (5,'제목555', '내용555555', 4);
insert into post(id,title,contents) values (6,'제목6666', '내용6666' );

-- update 테이블명 set 컬럼명 = 데이터 where id =1;
update author set email = 'abc@test.com' where id =1;