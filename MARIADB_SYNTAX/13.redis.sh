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

# 캐싱 기능 구현
# 1번 author 회원 정보 조회
# select name, email, age from author where id=1;
# 위 데이터의 결과 값을 redis로 캐싱 : json 데이터 형식으로 저장
set user:1:detail "{\"neme\" : \"hong\", \"email\":\"honggildong@naver.com\", \"age\":\"30\" }"
# 캐싱시 데이터베이스가 업데이트 됐을시 레디스도 업데이트를 해야함

# list
# redis의 list는 java의 deque와 같은 구조

# 데이터 왼쪽 삽입
LPUSH [key] [value]
# 데이터 오른쪽 삽입
RPUSH [key] [value]
#데이터 왼쪽부터 꺼내기
LPOP key
# 데이터 오른쪽부터 꺼내기
RPOP key

lpush hongildongs hong1
lpush hongildongs hong2
lpush hongildongs hong3

lpop hongildong #hong3
# 꺼내서 없애는게 아니라 보기만
lrange hongildongs 0 0
lrange hongildongs -1 -1

#데이터 개수 조회
llen key
llen hongildongs
# list의 요소 조회시에는 범위 지정
lrange hongilongs 0 -1 #처음부터 끝까
# start부터 end까지 조회
lrange [start] [end]

# TTL 적용
expire hongildongs 30
# TTL 조회
ttl hongidongs

# pop과 push 동시에 하는 명령어
RPOPLPUSH A리스트 B리스트

# 어떤 목적으로 사용될수 있을까?
# 최근 방문한 페이지 (시간순서대로 저장 꺼내기)
# 5개 정도 데이터 push
# 최근 방문한 페이지 3개 정도만 보여주는 
lpush recent_page page1
lpush recent_page page2
lpush recent_page page3
lpush recent_page page4
lpush recent_page page5

lpop recent_page 
lpop recent_page 
lpop recent_page 


# set 자료구조
# set 자료구조에 멤버 추가
sadd members member1
sadd members member2
sadd members member1
#set 조회
smembers members

# set 에서 멤버 삭제
srem members member1
#set 멤버 개수 반환
scard members

#특정 멤버가 set 안에 있는지 존재여부 확인
sismember members member3

# 매일 방문자수 계산
sadd visit:2024-05-27 hong1@naver.com
sadd visit:2024-05-27 hong2@gmail.com
sadd visit:2024-05-27 hong3@daum.com

# zset(sorted set)
zadd zmembers 3 member1
zadd zmembers 4 member2
zadd zmembers 1 member3
zadd zmembers 2 member4

# zset 조회
# 스코어기준 오름차순 정렬
zrange zmembers 0 -1
# 스코어기준 내림차순 정렬
zrevrange zmembers 0 -1
# Zset 삭제
zrem zmembers
# 해당 멤버가 index 몇번째인지 출력
zrank zmembers member2

# 최근본 상품목록 => sorted set (zset) 을 활용하는것이 적절
zadd recent:products 192411 apple
zadd recent:products 192423 apple
zadd recent:products 192425 banana
zadd recent:products 192429 orange
zadd recent:products 192430 apple
zadd recent:products 192431 apple

zrevrange recent:products 0 3

#hashes
# 해당 자료구조에서는 문자, 숫자가 구문
hset product:1 name "apple" price 1000 stock 50
# 특정 요소값 수정
hset product:1 stock 40

# 특정 요소의 값 증가/
hincrby product:1 stock 5


# 정리
String : key:value => 좋아요, 재고관리
list : key : value가 리스트 형식인데 deque => 최근 방문 페이지
set : 중복제거, 순서없음 => 오늘 방문자수
zset : 순서있는 set => score 시간으로 가장 많이 사용 
 => 최근본상품목록
hset(hashes) => 객체형식으로 value값. 연산의 편의 hinvry

redis => pub/sub 구조
publish : 발행하다.
subscribe : 구독하다.
메세지의 pub sub 구조 => rabbitmq, redis, kafka