echo Downloading Hadoop ...
wget -q https://archive.apache.org/dist/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz
echo Installing Hadoop ...
mkdir hadoop
tar xzf hadoop-2.7.1.tar.gz -C hadoop --strip-components=1
cp -f /vagrant/etc/hadoop/*-site.xml hadoop/etc/hadoop/.
sed -i "s/\${JAVA_HOME}/\/usr\/lib\/jvm\/java-1.8.0-openjdk.x86_64/g" hadoop/etc/hadoop/hadoop-env.sh
set JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64
./hadoop/bin/hdfs namenode -format

