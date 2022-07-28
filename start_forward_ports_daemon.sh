#!/bin/bash

cp forward_ports.service /etc/systemd/system/forward_ports.service #for root

#for normal users
#cp forward_ports.service /home/devops/.config/systemd/user/forward_ports.service
systemctl daemon-reload
systemctl restart forward_ports.service
systemctl enable forward_ports.service
