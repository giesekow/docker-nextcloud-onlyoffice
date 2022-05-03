#!/bin/bash

sed -i "s%\$WORKDIR%$(pwd)%g" nextcloud.service
sudo cp bonescreen.service /etc/systemd/system/
sudo cp bonescreen.service /lib/systemd/system/

chmod +x start.sh
chmod +x stop.sh

sudo systemctl start nextcloud
sudo systemctl enable nextcloud