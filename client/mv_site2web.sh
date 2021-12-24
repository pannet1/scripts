#!/usr/bin/bash
if [ $# -lt 2 ]
 then 
echo 'usage: <command> localsite serversite'
exit 1;
fi

whoami="$(logname)"
html="/home/$whoami/Programs/php"
mysqldump -u root -p c0_$1 > $html/$1/web/c0_$1.sql
rsync -av --update --links --delete --force --stats -e ssh --exclude='.git' --exclude='node_modules' --exclude='vendor' --exclude='*.log' --exclude='tmp' --exclude='*.lock' --exclude='*log' $html/$1/web/ carrierc@ecomsense.in:/home/carrierc/$2
echo "dont forget to move your site $2 from vultr home to webroot"
ssh -t carrierc@ecomsense.in "sudo ./_mv_site2web.sh $2; sudo mysqldump -u root -p c0_$1 < $html/$2/web/c0_$1.sql"
