 #!/bin/bash
if [ $# -eq 0 ]
 then 
 echo 'usage: <command> sitename'
 exit 1;
fi

dest="/var/www/$1/web";
echo $dest;
if [ -d "$dest" ]; then
   cp $1/. $dest -Rv;
   rm -rf $1;
   echo "copied to $dest";	
one=(stat -c "%U" $dest)
two=(stat -c "%G" $dest)
usr=echo "${one[@]}"
grp=echo "${two[@]}"
chown $usr.$grp $dest -Rv
   cd $dest;  
   find . -type d -print -exec chmod 755 {} \;   
   find . -type f -print -exec chmod 644 {} \;  
   echo "changed permissions recursively"; 
else
   echo "$dest not found. check if folder exists and try again" 
   exit 1;
fi
if [ -d "$dest" ]; then
    echo "changing perms of web/tmp";
    cd $dest;
    chmod 777 $dest -Rv;
fi
    
