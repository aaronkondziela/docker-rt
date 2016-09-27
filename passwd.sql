USE mysql;
UPDATE user SET password=PASSWORD('thisisatest') WHERE user='rt_user';
UPDATE user SET password=PASSWORD('thisisatest') WHERE user='root';
FLUSH PRIVILEGES;
