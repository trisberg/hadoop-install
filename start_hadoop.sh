echo Starting Hadoop ...
set JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64
set HADOOP_PREFIX=~/hadoop
set HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
set YARN_CONF_DIR=$HADOOP_CONF_DIR
set PATH=$PATH:$HADOOP_PREFIX/bin
./hadoop/sbin/start-dfs.sh
./hadoop/sbin/start-yarn.sh
./hadoop/sbin/mr-jobhistory-daemon.sh start historyserver
