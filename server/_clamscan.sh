sudo apt-get install clamav clamav-daemon clamtk
sudo freshclam
echo "sudo clamscan -r /folder/to/scan/ | grep FOUND >> /path/to/save/report/myfile.txt"
