# script 파일 생성
touch myscript.sh
# 실행할땐 "./" 무조건 사용!!
#1. 시작할때 script start 문구 출력
#2. 홈디렉토리에서 my_dir4 생성
#3. my_dir4 에서 file1.txt, file2.txt 파일 생성
#4. file1.txt에서 "hello file1" 입력, file2.txt에 "hello file2 입력"
#5. file1은 file1_backup.txt로 백업 파일 보관
#6. file2 는 file2_rename.txt로 파일명 변경
#7. script end 문구 출력하면서 종료

  #1
  echo "Script Start"
  #2
  mkdir ./home/my_dir4
  
  #3
  cd ./home/my_dir4
  touch file1.txt
  touch file2.txt
 
 #4
 echo "hello file1" > file1.txt
 echo "hello file2" > file2.txt
 
 #5
 cp file1.txt file1_backup.txt
 #6
 mv file2.txt file2_rename.txt
 #7
 echo "Script End"

# If 문
if [1 -gt 2] ; then
    echo "hello world1";
else 
    echo "hello world2";
fi

#if문과 변수활용, 파일 디렉토리 존재여부 확인
file_name = "second_file.txt"
if [ -f "$file_name" ]; then
    echo "$file_name exsist"
else
    echo "$file_name does not exist"
fi

# for문 기본
for a in {1..100}
do
    echo "hello world$a"
done

# for문 활용한 count 세기
dir_name="d"
count=0
for a in {1..100}
do
	((count++))
done
echo "count is $count"
count = 0

# for문 활용한 모든 파일, directory 목록 출력하기
for a in *
do
    echo "a is $a"
done

# for문 활용한 directory의 개수와 그 외의 개수 세기
dir_count=0
other_count=0
for a in * 
do
	if [ -d "$a" ]; then
		((dir_count++))
	else
		((other_count++))
	fi
done

echo "dir_count is $dir_count"
echo "the other count is $other_count"
