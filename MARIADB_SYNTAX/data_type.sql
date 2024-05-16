-- tinyint 는 -129 ~ 127까지 포함
-- author 테이블에 age 컬럼 추가.\
alter table author add column age tinyint;

--insert 시에 age : 200
--125 초과 입력시 에러
insert into author(id, name, email,age) values(6,'ㅂㅂ','ㅇㅇ',200);
--125 이하시 정상 입력
insert into author(id, name, email,age) values(6,'ㅂㅂ','ㅇㅇ',125);
--unsigned 시에 음수를 제한함으로써  양수 255 까지 표현범위 확대
alter table author modify column age tinyint unsigned;
insert into author(id, name, email,age) values(7,'ㅂㅂ','ㅇㅇ',200);

-- decimal 실습
alter table post add column price decimal(10,3);

--decimal 소수점 초과값 입력후 짤림 ghkrdls
insert into post(id,title,price) values(7,"HELLO",3.123123);
-- update : price를 1234.1
update post set price = 1234.1 where id = 7; 