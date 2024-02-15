#!/bin/bash

if [[ $EUID != "0" ]]; then
    echo "!! Run as root"
    exit
fi

olddir=$(pwd)
cd /home/ubuntu
rm -fr /home/ubuntu/minecraft-event-provisioning ; git clone -c "core.sshCommand=ssh -i ./jumphost -o StrictHostKeyChecking=no" git@github.com:minecraft-terraform/minecraft-event-provisioning.git

usernames=$(awk -F: '($3>=1000)&&($1!="nobody"){print $1}' /etc/passwd |grep -v ubuntu)

# Loop door de gebruikersnamen en maak de gebruikers aan
for username in ${usernames}; do
	username_dir=$(getent passwd "${username}" | cut -d: -f6)
    if [[ -d ${username_dir}/minecraft-terraform-main ]]; then rm -fr ${username_dir}/minecraft-terraform-main ; fi
    cp -r /home/ubuntu/minecraft-event-provisioning/minecraft-terraform-main ${username_dir}/.
    cp -r /home/ubuntu/vscode-profile ${username_dir}/.
    chown -R ${username}:ubuntu ${username_dir}

done

echo "Script voltooid."