echo Downloading Spark ...
wget -q http://mirror.nexcess.net/apache/spark/spark-1.4.1/spark-1.4.1-bin-hadoop2.6.tgz
echo Installing Spark ...
mkdir spark
tar xzf spark-1.4.1-bin-hadoop2.6.tgz -C spark --strip-components=1
set JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64
set HADOOP_PREFIX=~/hadoop
set HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
set YARN_CONF_DIR=$HADOOP_CONF_DIR
set PATH=$PATH:$HADOOP_PREFIX/bin
./hadoop/bin/hdfs dfs -mkdir /app/spark 2> null
./hadoop/bin/hdfs dfs -copyFromLocal spark/lib/spark-assembly-1.4.1-hadoop2.6.0.jar /app/spark/spark-assembly-1.4.1-hadoop2.6.0.jar 2> null
