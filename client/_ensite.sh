#!/bin/bash

if [ $# -eq 0 ]
 then
 echo 'no argument supplied'
 exit 1;
fi

whoisme="$(logname)";
echo "i am "$whoisme;
mnt="/run/media/pannet1/FAT32"
bkp="$mnt/latest/Programs/php"
web="/home/$whoisme/Programs/php";
src="$bkp/$1/";

if [ -d "$src" ]; then
    echo "backup found .. at $src";
    mkdir -pv $web/$1/log;
    cp $src  $web/$1/web/ -rv
    echo "copying from backup done";
else

    echo "${src} does not exist. creating .."
    mkdir $web/$1/web -pv
    mkdir $web/$1/log -pv
    
    echo -e "\033[0;31m do you wish to install wordpress database ? \033[0m "
    select yn in "yes" "no"; do
        case $yn in
            yes )  mysqladmin create $1_wp -p
                   break;;
            no ) break;;
        esac
    done
 fi

    echo "echo $1" >> /home/$whoisme/Scripts/client/rsyncronjobs
    echo "rsync --archive --update --delete --force --stats --exclude 'tmp' --exclude 'vendor' --exclude 'composer.lock' /var/www/html/$1 $bkp/" >> /home/$whoisme/Scripts/client/rsyncronjobs
chown "${whoisme}.${whoisme}" $web/$1 -Rv 


cp /home/$whoisme/Scripts/client/virtual_host /etc/httpd/conf/sites-available/$1.conf
sed -i "s/default/$1/g" /etc/httpd/conf/sites-available/$1.conf
cd /etc/httpd/conf/
ln -s sites-available/$1.conf sites-enabled/$1.conf
systemctl restart httpd

cd $web/$1
echo "127.0.0.1 $1" >> /etc/hosts
grep -r "$1" /etc/httpd/conf/sites-available/
