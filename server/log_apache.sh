#!/bin/bash
cd /var/log
sudo multitail ispconfig/httpd/*/error.log
cd
