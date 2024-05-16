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
