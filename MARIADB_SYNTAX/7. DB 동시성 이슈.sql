-- dirty read 실습 (가장 낮은단계?)
-- 워크벤치에서 auto_commit을 해제후 update실핼 -> commit이 안된 상태
-- 터미널 열어서 select 했을때 변경사항이 변경 됐는지 확인
-- 반영 안되면 dirty read가 안됨 -> 문제 안됨


-- phantom read 동시성 이슈 실습
-- 워크벤치에서 시간을 두고 2번의 select가 이뤄지고, 중간에 터미널에서 insert 실행
-- 2번의 select 결과 값이 동일한지 확인
start transaction
select count(*) from author;
do sleep(15);
select count(*) from author;
commit;

-- 터미널에서 아래 insert문 실행
insert into author(name, email) values('kim', 'kim@gmail.com');

--lost upadate 이슈를 해결하기 위한 공유락(shared lock)
-- 워크벤치에서 아래 코드를 실행
start transaction;
select post_count from  author where id = 1 lock in share mode;
do sleep(15);
select post_count as late from author where id =1 lock in share mode;
commit



--터미널에서 실행
select post_count from author where id =1 lock in share mode;
update author set post_count = 0 where id =1;

--배타적 잠금 (exclusive lock) : select for update

start transaction;
select post_count from  author where id = 1 for update;
do sleep(15);
select post_count as late from author where id =1 for update;
commit



--터미널에서 실행
select post_count from author where id =1 for update;
update author set post_count = 0 where id =1;
