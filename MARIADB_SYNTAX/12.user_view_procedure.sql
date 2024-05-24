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

--글쓰기 : title,contents,email
DELIMITER //
CREATE PROCEDURE 글쓰기2(in 저자id int, in 제목 varchar(255), in emailInput varchar(255))
BEGIN
    DECKARE authorId int ;
    SELECT id into authorId FROM author WHERE email = emailInput;
    INSERT INTO post(author_id, title, email) values(저자id, 제목, authorId) ;
END
// DELIMITER

all 글쓰기('abc', '제목임당', '1');

--sql에서 무자열을 합치는 방법 concat('hello', 'world') ;
-- 글 상세 조회 : input 값이 postId
-- title,contents, '홍길동' + '님'
DELIMITER //
CREATE PROCEDURE 글상세조회(IN postId int)
BEGIN
    select p.title, p.contents,CONCAT(a.name,'님') as 이름 from post p join author a on p.author_id = a.id where p.id = postId;

END;
//
DELIMITER ;

call 글상세조회(1);

-- 등급 조회
-- 출력 :  글을 100개 이상 쓴 사용자느 고수입니다. 
-- 10개 이상 100개 미만이라면 중수 입니다.
-- 그 외는 초보입니다.
-- input 값 : email

DELIMITER //
CREATE PROCEDURE 등급조회(IN emailInput varchar(255))
BEGIN
    DECLARE post_count INT;

    SELECT COUNT(p.id) INTO post_count
    FROM post p
    WHERE p.author_id IN (SELECT a.id FROM author a WHERE a.email = emailInput);
    
    SELECT CASE 
        WHEN post_count >= 100 THEN "고수입니다."
        WHEN post_count BETWEEN 10 AND 99 THEN '중수입니다.'
        ELSE '초보입니다'
        END AS 평가;
END
//
DELIMITER ;

--if문 방법
DELIMITER //
CREATE PROCEDURE 등급조회(IN emailInput varchar(255))
BEGIN
    DECLARE post_count INT;
    DECLARE authorId INT;

    select id into authorId from author where email= emailInput;
    select COUNT(*) into post_count from post where author_id = authorId;
    IF post_count >= 100 THEN
        SELECT '고수입니다.';
    ELSEIF post_count >=10 and post_count < 100 THEN
        select '중수입니다.';
    ELSE
        select '초보입니다.';
    END IF
END
//
DELIMITER ;

-- 반복을 통해 post 대량 생성
--사용자가 입력한 반복 횟수에 따라 글이 도배되는데 title 은 '안녕하세요'
DELIMITER //

CREATE PROCEDURE 글도배(IN 횟수 INT)
BEGIN
    DECLARE a INT DEFAULT 0;
    
    WHILE a < 횟수 DO
        INSERT INTO post(title,author_id) VALUES('안녕하세요', 1);
        SET a = a + 1;
    END WHILE;
END //

DELIMITER ;

-- 프로시저 명으로 프로시저 찾기
show create procedure 프로시저명;

--프로시저 권한 부여
grant excute on board.글도배 to 'test1'@'localhost';