#!/system/bin/sh
DIR=${0%/*}
test=$DIR'/init.sh && '$DIR'/python '"$@"' && '$DIR'/end.sh'
cat $DIR/init.sh > $DIR/python-root
echo '\n' >> $DIR/python-root
echo $test >> $DIR/python-root
chmod 755 $DIR/python-root
su -c $DIR/python-root
