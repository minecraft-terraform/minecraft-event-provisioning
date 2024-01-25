#!/bin/bash

for creativeuser in $(awk -F':' '{ print $1}' /etc/passwd |grep -i creative)
do
	echo "--- $creativeuser"
	cp -r minecraft-terraform-main /home/${creativeuser}/.
        cp vscode-profile /home/${creativeuser}/.
	chown -R ${creativeuser}:creative_users /home/${creativeuser}	
done
