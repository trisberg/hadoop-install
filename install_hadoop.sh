echo Downloading Hadoop ...
wget -q http://mirror.nexcess.net/apache/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
echo Installing Hadoop ...
tar xzf hadoop-2.6.0.tar.gz
cp -f /vagrant/etc/hadoop/*-site.xml hadoop-2.6.0/etc/hadoop/.
sed -i "s/\${JAVA_HOME}/\/usr\/lib\/jvm\/java-1.7.0-openjdk.x86_64/g" hadoop-2.6.0/etc/hadoop/hadoop-env.sh
set JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64
./hadoop-2.6.0/bin/hdfs namenode -format

