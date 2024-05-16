dir_name="d"
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


