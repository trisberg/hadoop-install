echo Installing Redis ...
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm
yum -y install redis
sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/g" /etc/redis.conf
