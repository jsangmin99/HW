file_name = "second_file.txt"
if [ -f "$file_name" ]; then
    echo "$file_name exsist"
else
    echo "$file_name does not exist"
fi
