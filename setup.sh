#!/bin/bash
pushd /opt/docker-rt
cp .bash_aliases /root
cp .ghetto_init /root
cp tailer.sh /usr/bin
mysql_install_db
mysqld_safe &
echo "Sleeping for 3 seconds to let mysql come up..."
sleep 3
echo "Continuing."
mysql_secure_installation
pushd /opt/rt-src/rt
autoconf
# --enable-developer checks deps for running tests
./configure --enable-developer
make testdeps
make install
make initialize-database
popd 
echo "running passwd.sql"
mysql < passwd.sql
echo "copying conf files into place"
cp RT_SiteConfig.pm /opt/rt4/etc/
cp 000-default.conf /etc/apache2/sites-available/
cp -f ports.conf /etc/apache2/ports.conf
echo "starting apache"
apache2ctl start
popd
echo "Go run dzil setup if you are doing extensions"
echo "docker-rt setup complete."

