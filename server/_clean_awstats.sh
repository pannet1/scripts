#!/bin/bash
find /var/log/ispconfig/httpd -type l -name 'yesterday*' -print
find /var/log/ispconfig/httpd -type l -name 'yesterday*' -delete
find /var/log/ispconfig/httpd -type l -name 'yesterday*' -print

