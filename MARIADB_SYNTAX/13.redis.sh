sudo apt-get update
sudo apt-get install redis-server
redis --version

# 레디스 접속
# cli : commendline interface
redos-cli

# redis는 0~15번까지의 database 구성
# 0번이 DEFALT
# 데이터베이스 선택
select 번호

# 데이터베이스내 모든 키 조회
keys *


# https://redis.io/docs/latest/develop/data-types/
#일반 String 자료구조
# key : value 값 세팅
# key값은 중복되면 안됨
SET key(키) value(값)
set test_key1 test_value1
set user:email:1 hongildong2@naver.com
# set 할떄 이미 있는 Key를 쓰면 값이 덮어쓰기되는것이 기본
# 맵 저장소에서 key값은 유일하게 관리되므로

# nx : not exist
set user:email:1 hongildong2@naver.com nx

# ex(만료시간-초단위) - ttl(time to live)
set user:email:2 hong2@naver.com ex 20

# get 을 통해 value 값 얻기
get test_key1

# 특정키 삭제
del user:email:1

# 현재 데이터베이스 모든 key 값 삭제
flushdb

# 좋아요 기능 구현
# 직접 redis안에서 할일이 없다 프로그램으로 조작
set likes:posting:1 0
incr likes:posting:1 # 특정 key 값의 value를 1만큼 증가
decr likes:posting:1 # 특정 key 값의 value를 1만큼 감소

# 재고 기능 구현
set product:1:stock 100
decr product:1:stock
get product:1:stock

# bash쉘을 활용하여 재고감소 프로그램 작성 