-- inner join
-- 두테이블 사이에 지정된 조건에 맞는 레코드만 반환 , on 조건을 통해 교집합 찾기
select * from author inner join post on author.id = post.author_id;
select * from author a inner join post p on a.id = p.author_id;

-- 글쓴이가 있는 글 목록과 글쓴이의 이메일을 출력하시오
SELECT p.id, p.title, p.contents, a.email from post p inner join author a  on p.id = a.id;

-- 모든 글 목록을 출력하고, 만약 글쓴이가 있다면 이메일을 출력
select p.id, p.title , p.contents, a.email 
from post p right join author a on p.id = a.id;

--join된 상황에서의 where 조건 : on 뒤에 where 조건이 나옴

--1) 글쓴이가 있는 글중에 글의 title 과 저자의 email을 출력,
-- 저자의 나이는 25세 이상인 글만 출력
select p.title, a.email
from post p join author a on p.author_id = a.id
where a.age >= 25;

--2) 모든 글 목록 중에 글의 title과 저자가 있다면 email을 출력,
--  2024-05-01 이후에 만들어진 글만 출력
select a.email
from post p join author a on p.author_id = a.id
where p.created_time > '2024-05-01'

-- 조건에 맞는 도서와 저자 리스트 출력

--union : 중복제외한 두 테이블의 select문을 결합
-- 컬럼의 개수와 타입이  같아야 함에 유의
--union all : 중복 포람
select 컬럼1, 컬럼2 from table1 union select 컬럼1, 컬럼2 from table2

-- author 테이블의 name, email 그리고 post테이블의 title, contents union
select name, email from author union select title, contents from post;

-- 서브쿼리 : select문 안에 또다른 select 문을 서브쿼리라한다.
-- select절 안에 서브쿼리
-- author email 과 해당 author가 쓴글의 개수를 출력
select email, (select count(*) from post p where p.author_id = a.id)
form author a;
select * from post where author_id = 1;

-- from절 안에 서브쿼리

-- where절 안에 서브쿼리

select a.* from author a join post p on a.id = p.author_id;
select * from author where id in (select author_id from post);

-- 없어진 기록 찾기 문제;
-- join으로 풀수있는 문제, 서브쿼리로도 풀어보기

--집계함수
select count(*) from author;
select sum(price) from post;
select round(avg(price), 0) from post;

--group by와 집계함수
select author_id, count(*), sum(price), ROUND(avg(price),0), min(price), max(price)
from post 
group by author_id;

--저자 email, 해당저자가 작성한 글 수를 출력
select a.id, count(p.id) 
from author a left join post p on a.id = p.author_id
group by author_id;

--where와 group by
-- 연도별 post 글 출력, 연도가 null인 데이터는 제외
select date_format(created_time, '%Y') as 연도, count(*)
from post 
where created_time is not null
group by date_format(created_time, '%Y');

--자동차 종류별 특정 옵션이 포함된 자동차수 구하기

-- 입양 시각 구하기(1)

--HAVING : group by를 통해 나온 통계에 대한 조건
select author_id, count(*) from post group by author_id;
select author_id, count(author_id) as count
from post 
group by author_id 
HAVING count >=2;

-- (실습) 포스트 price가 2000원 이상인 글을 대상으로,
-- 작성자 별로 몇건인지와 평균 price를 구하되
-- 작성자별로 평균price가 3000원 이상인 데이터를 대상으로만 통계 출력
select author_id, avg(price) as avg_price
from post
where price >=2000
group by author_id
having avg(price) >=3000;

-- 동명 동물수 찾기
-- (실습) 2건 이상의 글을 쓴 사람의 email과 글의 개수를 구할건데,
-- 나이는 25세 이상인 사람만 통계에 사용하고, 가장 나이 많은 사람 1명의 통계만 출력
select a.email, count(p.id) as count
from author a join post p on a.id = p.author_id;
where a.age >= 25
group by a.id
having count >= 2 
limit 1;

-- 다중열 group by
select author_id, title, count(*)
from post
group by author_id, title;
