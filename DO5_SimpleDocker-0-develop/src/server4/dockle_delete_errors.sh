#!/bin/bash
sudo apt-get install
sudo apt-get clean && rm -rf /var/lib/apt/lists/*
dockle olga_doc:new --accept-key=NGINX_GPGKEY
