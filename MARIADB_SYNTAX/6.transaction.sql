-- author 테이블에 post_count 라고 컬럼(int) 추가
alter table author add column post_count int default 0;

-- post에 글쓴 후에, author 테이블에 post_count 값에 +1 => 트랜잭션
start transaction;
update author set post_count = post_count+1 where id =1; 
insert into post(title, author_id) values('hello world java', 5);
commit;
-- 또는
rollback;

--stored 프로시저를 활용한 트랜잭션 테스트
DELIMITER //
CREATE PROCEDURE InsertPostAndUpdateAuthor()
BEGIN
    -- 트랜잭션 시작
    START TRANSACTION;
    -- UPDATE 구문
    UPDATE author SET post_count = post_count+1 WHERE id = 1;
    -- UPDATE가 실패했는지 확인하고 실패 시 ROLLBACK 및 오류 메시지 반환
    IF (ROW_COUNT() = 0) THEN
        ROLLBACK;
    END IF;
    -- INSERT 구문
    INSERT INTO post (title, author_id) VALUES ('2231', 11);
    -- INSERT가 실패했는지 확인하고 실패 시 ROLLBACK 및 오류 메시지 반환
    IF (ROW_COUNT() = 0) THEN
        ROLLBACK;
    END IF;
    -- 모든 작업이 성공했을 때 커밋
    COMMIT;
END //
DELIMITER ;
-- 프로시저 호출
CALL InsertPostAndUpdateAuthor();

