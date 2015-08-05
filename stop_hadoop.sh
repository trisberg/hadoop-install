echo Stopping Hadoop ...
set JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64
set HADOOP_PREFIX=~/hadoop-2.7.1
set HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
set YARN_CONF_DIR=$HADOOP_CONF_DIR
set PATH=$PATH:$HADOOP_PREFIX/bin
./hadoop-2.6.0/sbin/mr-jobhistory-daemon.sh stop historyserver
./hadoop-2.6.0/sbin/stop-yarn.sh
./hadoop-2.6.0/sbin/stop-dfs.sh
