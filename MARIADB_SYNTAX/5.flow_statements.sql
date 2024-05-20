-- 흐름제어 : case문
select 컬럼1, 컬럼2, 컬럼3,
case 컬럼4
    when [비교값1] then 결과값1
    when [비교값1] then 결과값1
    else 결과값3
end
from 테이블명

-- 실습
-- post 테이블에서 1번 user 는 first author, 2번 user는 second author
select id, title, contents,
    case author_id
        when 1 then 'first author'
        when 2 then 'second author'
        else 'others'
    end
from post;

-- author_id가 있으면 그대로 출력 else author_id, 없으면 '익명사용자'로 출력되도록 post 테이블 조회
select id, title, contents,
    case author_id
        when null then author_id
        else '익명사용자'
    end
from post;

-- 위 case 문을 ifnull구문으로 변환
-- if문 구문으로 변환
select id ,title, contents,ifnull(author_id, '익명사용자')
from post;