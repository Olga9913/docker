#!/bin/bash
sudo gcc server.c -lfcgi -o server
sudo spawn-fcgi -p 8080 ./server
sudo service nginx start
/bin/bash