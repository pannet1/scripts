#!/bin/bash
cd /var/log
sudo multitail daemon.log debug syslog apache2/error.log auth.log fail2ban.log mail.info php7.0-fpm.log syslog mail.log pure-ftpd/transfer.log ispconfig/auth.log --mergeall
cd
