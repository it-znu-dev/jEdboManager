 #!/bin/bash
FILES=/home/sysadmin/jEdboManager/sql/*.sql
mysql -uroot -psa -e"create database if not exists dekanat default character set utf8 collate utf8_unicode_ci;"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  # head -n 20 $f
  mysql -uroot -psa dekanat < $f
done