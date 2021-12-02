#!/bin/bash

whoisme="$(logname)";
echo "i am "$whoisme;

data_mount="FAT32/local";
web="/var/www/html";

bkp="/home/$whoisme/Backup/hosting/home";
dest=$bkp/$1

if [ $# -eq 0 ]
 then 
 echo 'no argument supplied'
 exit 1;
fi

if [ -d "$dest" ]; then  
   echo "directory exists and will be synced."              
   rsync -avvz --update  --exclude --stats --progress '.*' $web/$1/ $bkp/$1
   echo "directory existed and was synced."              
else
    echo "no directory found. copying"
    	cp $web/$1/ $dest -Rv    
    echo "done. copying"
fi
echo "document root and log files removed ."              
    	rm -rv $web/$1 
    
echo "disabling site"
    a2dissite $1
    service apache2 reload
    
echo "removing virtual site entry"
    rm -rf /etc/apache2/sites-available/$1.conf
    
echo "removing local host entry"
    sed '/$1/d'  /etc/hosts

echo "removing weekly sunday rysncronjob"
    sed '/$1/d' /home/$whoisme/Scripts/client/rsyncronjobs
    cat /home/$whoisme/Scripts/client/rsyncronjobs


