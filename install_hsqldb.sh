echo Downloading HSQLDB ...
wget -q https://sourceforge.net/projects/hsqldb/files/hsqldb/hsqldb_2_3/hsqldb-2.3.3.zip
echo Installing HSQLDB ...
sudo yum -y install unzip
unzip -q hsqldb-2.3.3.zip
mv hsqldb-2.3.3/hsqldb hsqldb
rmdir hsqldb-2.3.3
