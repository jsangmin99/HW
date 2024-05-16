--테이블 컬럼조회
describe author
-- 테이블 생성문 조회
SHOW CREATE TABLE author

--post 테이블 신규 생성(id,title, content, author_id)
CREATE TABLE posts(
    id int primary key,
    title varchar(255),
    content varchar(255),
    author_id int,
    foreign key(author_id) references authors(id)
);

--(외래키 같은 경우는 이루에 별도로 제약조건을 걸음 왜냐하면 제약조건이 많아 질수 있기 때문)