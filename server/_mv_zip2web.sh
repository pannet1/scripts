 #!/bin/bash
if [ $# -eq 0 ]
 then 
 echo 'usage: zip2web web client filename'
 exit 1;
fi
if [ $# -eq 1 ]
 then 
 echo 'usage: zip2web username groupname filename'
 exit 1;
fi
if [ $# -eq 2 ]
 then 
 echo 'usage: zip2web username groupname filename'
 exit 1;
fi
unzip $3.zip
dest="/var/www/clients/$2/$1/web";
echo $dest;
if [ -d "$dest" ]; then  
   echo "copying zip to $dest";              
   cp $3/. $dest -Rv;
   echo "changing permissions recursively";
   chown $1:$2 $dest -Rv;
   echo "cleaning up download wordpress archive"
   rm -rf $3.zip $3;
   cd $dest;
   cd ..;
   find . -type d -print -exec chmod 755 {} \;   
   find . -type f -print -exec chmod 644 {} \;
   cd $dest;	
   ls -la;
else
   echo "$dest not found. check if folder exists and try again" 
fi
