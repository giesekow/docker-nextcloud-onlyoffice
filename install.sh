#!/bin/bash

sed -i "s%\$WORKDIR%$(pwd)%g" nextcloud.service
sudo cp nextcloud.service /etc/systemd/system/
sudo cp nextcloud.service /lib/systemd/system/

chmod +x start.sh
chmod +x stop.sh

sudo systemctl start nextcloud
sudo systemctl enable nextcloud
