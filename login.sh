#!/bin/bash

# 备份当前的 sshd_config 文件
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# 修改 PermitRootLogin 和 PasswordAuthentication 选项
sed -i 's/^PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# 重启 SSH 服务
if systemctl is-active --quiet ssh; then
    systemctl restart ssh
elif systemctl is-active --quiet sshd; then
    systemctl restart sshd
else
    service ssh restart
fi

echo "SSH 配置已修改并重启服务。"
