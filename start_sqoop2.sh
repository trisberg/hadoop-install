echo Starting Sqoop ...
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64
export HADOOP_PREFIX=~/hadoop
export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
export SQOOP_HOME=~/sqoop2
export PATH=$PATH:$HADOOP_PREFIX/bin:$SQOOP_HOME/bin
./sqoop/bin/sqoop2-server start

