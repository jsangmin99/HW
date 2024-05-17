--not null 조건 추가
alter table 테이블명 modify column 컬럼명 타입 not null;

-- auto_increment
alter table author modify column id bigint auto_increment;
alter table post modify column id bigint auto_increment;

--제약조건 확인
select * from information_schema.key_column_usage where table_name = 'post';

--author.id 에 제약조건 추가시 fk로 인해 문제 발생시
--fk먼저 제거 이후에 authr.id에 제약조건 추가

--삭제
alter table post drop foreign key post_ibfk_1;

--제약조건 확인
select * from information_schema.key_column_usage where table_name = 'post';

--삭제된 제약조건 다시 추가
ALTER table post 
    add constraint post_author_fk foreign key author_id

--uuid
alter table post add column user_id char(36) DEFAULT (uuid());

--
alter table author modify column email varchar(255) unique;

--on delete cascade 테스트 => 부모테이블의 id를 수정하면? 수정안됨.
--조회
select * from information_schema.key_column_usage where table_name = 'post';
--재약조건 삭제
alter table post drop foreign key post_author_fk;
--delete cascade 제약조건 추가
ALTER table post 
    add constraint post_author_fk foreign key (author_id) references author(id) on delete cascade

-- 부모 : author 자식: post , 부모의 id 삭제시 에러 안남 근데 수정하면 에러남
DELETE  FROM  author  WHERE id = 4;

-- on update casecade 테스트
ALTER table post 
    add constraint post_author_fk foreign key (author_id) references author(id) on delete cascade on UPDATE cascade;

UPDATE  author  SET id = 15 where id = 2;

--(실습) delete 는 set null, update는 cascade

-- 