echo Downloading Sqoop ...
wget -q http://archive.apache.org/dist/sqoop/1.99.6/sqoop-1.99.6-bin-hadoop200.tar.gz
echo Installing Sqoop ...
mkdir sqoop
tar xzf sqoop-1.99.6-bin-hadoop200.tar.gz -C sqoop --strip-components=1
sed -i "s/@LOGDIR@/\/home\/vagrant\/sqoop\/logs/g" sqoop/server/conf/sqoop.properties
sed -i "s/@BASEDIR@/\/home\/vagrant\/sqoop/g" sqoop/server/conf/sqoop.properties
echo Creating sym links for Sqoop ...
sudo ln -s ~/hadoop/share/hadoop/common /usr/lib/hadoop
sudo ln -s ~/hadoop/share/hadoop/hdfs /usr/lib/hadoop-hdfs
sudo ln -s ~/hadoop/share/hadoop/mapreduce /usr/lib/hadoop-mapreduce
sudo ln -s ~/hadoop/share/hadoop/yarn /usr/lib/hadoop-yarn
sudo mkdir /etc/hadoop
sudo ln -s /home/vagrant/hadoop/etc/hadoop /etc/hadoop/conf

