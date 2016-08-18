#!/bin/bash

pushd /opt/rt-src/docker-rt
mysql_install_db
mysqld_safe &
mysql_secure_installation
pushd /opt/rt-src/rt
autoconf
./configure
make testdeps
make install
make initialize-database
popd 
mysql < passwd.sql
cp RT_SiteConfig.pm /opt/rt4/etc/
cp 000-default.conf /etc/apache2/sites-available/
popd


