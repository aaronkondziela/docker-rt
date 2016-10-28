#!/bin/bash
pushd /opt/docker-rt
cp tailer.sh /usr/bin
mysql_install_db
mysqld_safe &
mysql_secure_installation
pushd /opt/rt-src/rt
autoconf
# --enable-developer checks deps for running tests
./configure --enable-developer
make testdeps
make install
make initialize-database
popd 
mysql < passwd.sql
cp RT_SiteConfig.pm /opt/rt4/etc/
cp 000-default.conf /etc/apache2/sites-available/
cp -f ports.conf /etc/apache2/ports.conf
apache2ctl start
popd
echo "Go run dzil setup if you are doing extensions"

