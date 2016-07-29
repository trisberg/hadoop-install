echo Stopping Hadoop ...
set JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
set HADOOP_PREFIX=~/hadoop
set HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
set YARN_CONF_DIR=$HADOOP_CONF_DIR
set PATH=$PATH:$HADOOP_PREFIX/bin
./hadoop/sbin/mr-jobhistory-daemon.sh stop historyserver
./hadoop/sbin/stop-yarn.sh
./hadoop/sbin/stop-dfs.sh
