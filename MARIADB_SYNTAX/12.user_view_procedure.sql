-- 상용자 관리
-- 사용자 목록 조회
select * from mysql.user;

--사용자 생성
create user 'test1'@'%' identified by '4321'
create user 'test2'@'localhost' identified by '4321'

-- 사용자에게 권한 부여
grant select on board.author to "test1"@"%";

--사용자 구너한 회수
revoke select on board.author from 'test1'@'localhost';

--사용자 권한 확인
SHOW GRANTS for 'test1'@'%';

flush privileges;

--test1로 로그인 후에
select * from board.author;

--사용자 계정 삭제
drop user 'test1'@'localhost';


ALTER TABLE board ADD name varchar(100);

--view
--view 생성
create view author_for_marketing_team as 
select name, age, role from author;

--view 조회
select * from author_for_marketing_team;

--test 계정 view select 권한 부여
grant select on board.author_for_marketing_team TO ...;


-- VIEW 변경(대체)
create replace view author_for_marketing_team as select name, email, age, role from author;

--view 삭제
DROP VIEW author_for_marketing_team;

--프뢰시저 생성
DELIMITER //
CREATE PROCEDURE test_procedure()
BEGIN
    SELECT 'HELLO WORLD' ;
END
// DELIMITER ;

--프로시저 호출
call test_procedure();

--게시글 목록 조회 프로시저 생성
DELIMITER //
CREATE PROCEDURE 유저목록조회()
BEGIN
    SELECT * from author;
END
// DELIMITER ;


call 게시글목록조회();

-- 게시글 단건조회
DELIMITER //
CREATE PROCEDURE 게시글단건조회(in 저자id int, in 제목 varchar(255))
BEGIN
    SELECT * from post where author_id = 저자id and title = 제목 ;
END
// DELIMITER ;

call 게시글단건조회(3);

-- 글쓰기 : title, contents, 저자ID
DELIMITER //
CREATE PROCEDURE 글쓰기(in 저자id int, in 제목 varchar(255), in 내용 varchar(255))
BEGIN
    INSERT INTO post(author_id, title, contents) values(저자id, 제목, 내용) ;
END
// DELIMITER ;

call 글쓰기(4, '제목임당', '내용임당');