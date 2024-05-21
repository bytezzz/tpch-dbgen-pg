mkdir tbl
for i in `ls *.tbl`
do
 name="tbl/$i"
 echo $name
 `touch $name`
 `chmod 777 $name`
 sed 's/|$//' $i >> $name;
done
