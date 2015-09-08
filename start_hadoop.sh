echo Starting Hadoop ...
set JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
set HADOOP_PREFIX=~/hadoop-2.7.1
set HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
set YARN_CONF_DIR=$HADOOP_CONF_DIR
set PATH=$PATH:$HADOOP_PREFIX/bin
# clean out old pid files
rm /tmp/*-vagrant-*.pid
# start hdfs, yarn and historyserver
./hadoop-2.7.1/sbin/start-dfs.sh
./hadoop-2.7.1/sbin/start-yarn.sh
./hadoop-2.7.1/sbin/mr-jobhistory-daemon.sh start historyserver
