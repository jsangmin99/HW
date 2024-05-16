echo "start"
dir_name="test_dir"
if [ -d "$dir_name" ]; then
	cd $dir_name
else
	mkdir "$dir_name"
	cd $dir_name
fi
###
###
if [ ! -e test4.txt ]; then
	touch test4.txt
fi
###
###
for a in {1..100}
do
	echo "hello world$a" >> test4.txt
done
echo "end"
