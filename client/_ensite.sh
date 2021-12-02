#!/bin/bash

if [ $# -eq 0 ]
 then
 echo 'no argument supplied'
 exit 1;
fi

whoisme="$(logname)";
echo "i am "$whoisme;

mnt="FAT32/local";
web="/var/www/html";
bkp="/home/$whoisme/Backup/hosting/home";
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


cp /home/$whoisme/Scripts/client/virtual_host /etc/apache2/sites-available/$1.conf
sed -i "s/default/$1/g" /etc/apache2/sites-available/$1.conf
a2ensite $1

service apache2 restart


cd $web/$1

grep -r "$1" /etc/apache2/sites-available/


echo "127.0.0.1 $1" >> /etc/hosts

service network-manager restart
