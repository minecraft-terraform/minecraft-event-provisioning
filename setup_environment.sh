#!/bin/bash
sudo data >/home/ubuntu/start.txt
sudo apt-get -y update
sudo apt-get -y upgrade
echo '$nrconf{restart} = "a";' | sudo bash -c 'cat >> /etc/needrestart/needrestart.conf'
sudo apt-get -y install gnupg software-properties-common jq
sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo apt -y update
sudo apt-get -y install terraform
sudo curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash
sudo tfswitch --default=1.5.7
sudo unlink /usr/local/bin/terraform
sudo mv /root/.terraform.versions/terraform_1.5.7 /usr/local/bin/terraform