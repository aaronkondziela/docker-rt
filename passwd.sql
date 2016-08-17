USE mysql;
UPDATE user SET password=PASSWORD('thisisatest') WHERE user='rt_user';
FLUSH PRIVILEGES;
