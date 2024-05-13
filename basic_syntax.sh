# 사용자가 현재 위치해 있치해 있는 폴더 경로 출력 명령어
pwd

# 현재 위치에서 파일, 폴더 목록을 출력
ls

# + 자세히 출력
ls -l

# 숨김파일 까지 풀력
ls -al

# 시간순서로 정렬 등등.. (오! 이건 처음해본다)
# 파일이 많을경우 전부다 보려면 눈알이 빠질텐데 최근 수정한걸 가깝게 볼수있다면 내가 주로 바꾸는것들을 빠르게 찾을수있기 때문에 유용할것 같다.
ls -alrt

# 디렉토리 생성
mkdir

# 특정 디렉토리로 이동
cd 디렉토리이름

# 루트 디렉토리(최상단의 디렉토리)로 이동
cd /

# 절데 경로 폴덩로 이동
cd /home/ubuntu/my_dir

# 상대 경로 폴더로 이동
cd .. # ..은 상위 폴더로 이동
cd . # . 은 현재 폴더를 의미

#home 경로로 이동
cd

# 직전 위치의 폴더로 이동
cd -

# 비어있는 파일 생성
touch firtst_file.txt

# 파일 내용 조회
cat firt_file.txt

# 터미널창에 문자열을 풀력하는 명령어
echo "hello world"

# echo 를 통해 파일에 문자열을 write 하는 방법
# > 하나를 쓰면 덮어쓰기 모드, >> 두개쓰면 추가모드
echo "hello world" > first_file.txt

# 명령어 사용기록 보기
history

# 화면 정리
clear

# mv는 이동명렬어 or 이름 변경 명령어
mv a.txt b.txt  #이름변경
mv a.txt ../a.txt #이동 명령어
mv a.txt ../a.txt #이동 및 이름변경 동시 가능

# 복사 명령어는 cp, 디렉토리까지 복사기에는 -r 옵션 추가
cp second_file.txt third_file.txt

# rm은 삭제 명령어 , -r 롭션을 통해 디렉토리까지 삭제 가능
# 리눅스마다 차이가 있으나 삭제할지 말지 물어보는 경우가 있는데
# -f 롭션은 묻지않고 삭제가 가능하게 한다. (강제삭제이므로 조심해야함)
rm third_file.txt

rm -rf my_dir3 

#현재폴더에 있는 모든 파일 삭제
rm -rf *

# head는 cat 처럼 파일을 출력하는 것인데 상위 n개행 조회
# tail 은 하위 n개 행 조회
head first_file.txt # 기본은 상위 10줄 출력
head -5 first_file.txt # 상위 5줄 출력

tail first_file.txt # 기본은 하위 10줄 출력
tail -5 first_file.txt # 하위 5줄 출력

# nano 편집기 사용
nano 파일명

# nano 명령어는 운영체제의 배포판 마다 다르다. 하지만 vi는 대부분 설치되어있다.

