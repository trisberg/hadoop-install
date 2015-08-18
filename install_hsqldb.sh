echo Downloading HSQLDB ...
wget -q http://hsqldb.org/download/hsqldb-2.3.3.zip
echo Installing HSQLDB ...
sudo yum -y install unzip
unzip hsqldb-2.3.3.zip
mv hsqldb-2.3.3/hsqldb hsqldb
rmdir hsqldb-2.3.3
