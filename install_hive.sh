echo Downloading Hive ...
wget -q http://mirror.nexcess.net/apache/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz
echo Installing Hive ...
mkdir hive
tar xzf apache-hive-1.2.1-bin.tar.gz -C hive --strip-components=1
cp -f /vagrant/etc/hive/*.properties hive/conf/.
cp -f /vagrant/etc/hive/*-site.xml hive/conf/.

