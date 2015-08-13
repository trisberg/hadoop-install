echo Downloading Hadoop ...
wget -q http://mirror.nexcess.net/apache/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz
echo Installing Hadoop ...
tar xzf hadoop-2.7.1.tar.gz
cp -f /vagrant/etc/hadoop/*-site.xml hadoop-2.7.1/etc/hadoop/.
sed -i "s/\${JAVA_HOME}/\/usr\/lib\/jvm\/java-1.8.0-openjdk/g" hadoop-2.7.1/etc/hadoop/hadoop-env.sh
set JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
./hadoop-2.7.1/bin/hdfs namenode -format

