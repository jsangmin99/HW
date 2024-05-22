# 로컬에서 sql 덤프파일 생성
mysqldump -u root -p --deafault-character-set=utf8mb4 board2 > dumpfile.sql
#한글 깨질때
mysqldump -u root -p --deafault-character-set=utf8mb4 board2 > dumpfile.sql
# 로컬 도커 mariadb를 로컬에 덤프파일 생성
docker exec [컨테이너 이름] /usr/bin/mysqldump -u [사용자 계정] -p [패스워드] --default-character-set=utf8mb4 [데이터베이스명] > [파일명].sql
docker exec mariadb /usr/bin/mariadb-dump -u root -pmariadb --default-character-set=utf8mb4 board2 > dumpfile.sql

# 원격 서버 도커에있는 파일을 로컬 컴퓨터에 덤프파일 생성
docker exec mariadb /usr/bin/mariadb-dump -h [호스트]-P [포트] -u root -p[비밀번호] --default-character-set=utf8mb4 public > dumpfile.sql

# 덤프파일을 git 업로그
#리눅스에서 mariadb 설치

#덤프 파일을 도커 mariadb에 복원할때
docker exec -i mariadb mariadb --user root --password=[비밀번호] [데이터베이스명] < [덤프파일이 있는 절대경로]