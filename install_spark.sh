echo Downloading Spark ...
wget -q http://www-us.apache.org/dist/spark/spark-1.6.2/spark-1.6.2-bin-hadoop2.6.tgz
echo Installing Spark ...
mkdir spark
tar xzf spark-1.6.2-bin-hadoop2.6.tgz -C spark --strip-components=1
set JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
set HADOOP_PREFIX=~/hadoop
set HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
set YARN_CONF_DIR=$HADOOP_CONF_DIR
set PATH=$PATH:$HADOOP_PREFIX/bin
./hadoop/bin/hdfs dfs -mkdir -p /app/spark 2> null
./hadoop/bin/hdfs dfs -chmod 777 /app/spark 2> null
./hadoop/bin/hdfs dfs -copyFromLocal spark/lib/spark-assembly-1.6.2-hadoop2.6.0.jar /app/spark/spark-assembly-1.6.2-hadoop2.6.0.jar 2> null
