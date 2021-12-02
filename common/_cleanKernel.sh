#/bin/bash
apt-get update -y
apt-get upgrade -y
ls /boot/ | grep vmlinuz | sed 's@vmlinuz-@linux-image-@g' | grep -v `uname -r` > /tmp/kernelList
for I in `cat /tmp/kernelList`
do
aptitude remove $I
done
rm -f /tmp/kernelList 
update-grub #not sure if neede
reboot
