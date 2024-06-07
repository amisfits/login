#!/bin/bash
echo root:kaka666999 |sudo chpasswd root
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^Port 10022/Port 22/' /etc/ssh/sshd_config
sudo systemctl start firewalld
sudo firewall-cmd --zone=public --add-port=22/tcp --permanent

sudo reboot
