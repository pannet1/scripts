echo "du -xh"
du -xh / |grep '^\S*[0-9\.]\+G'|sort -rn
echo "                       "
echo "df -h"
df -h
