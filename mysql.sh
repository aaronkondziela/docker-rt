#!/bin/bash

mysql_install_db
mysqld_safe &
mysql_secure_installation
