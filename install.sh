#!/bin/bash
#
# Setup Logging
#
sudo mkdir /tmp/install; cd /tmp/install
sudo touch ado_cloud_init.log
sudo echo "[$(date +%F_%T)] $(pwd)" >> ado_cloud_init.log
sudo echo "[$(date +%F_%T)] Starting cloud_init script" >> ado_cloud_init.log
#
# Package Upgrade
#
sudo apt-get update -y
#
# Install Cloud Config Packages
#
sudo apt-get install -y apt-transport-https -y
sudo apt-get install apt-transport-https -y
sudo apt-get install ca-certificates -y
sudo apt install gnupg -y
sudo apt-get install software-properties-common -y
sudo apt install zip --assume-yes
zip -v
sudo apt install unzip --assume-yes
unzip -v
#
# Install Docker
#
# sudo echo "[$(date +%F_%T)] Installing Docker" >> ado_cloud_init.log
# sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs)  stable"
# sudo apt install docker.io -y
# sudo usermod -aG docker ${vm_admin}
# sudo systemctl enable docker
# sudo systemctl start docker
sudo apt-get update -y
sudo apt install docker.io -y
#
# Install Azure CLi
#
sudo echo "[$(date +%F_%T)] Installing Azure CLI" >> ado_cloud_init.log
sudo curl -sL https://aka.ms/InstallAzureCLIDeb | bash
#
# Install Docker Compose
#
# sudo echo "[$(date +%F_%T)] Installing Docker Compose" >> ado_cloud_init.log
# sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
#
# Install Kubectl
#
sudo echo "[$(date +%F_%T)] Installing Kubectl" >> ado_cloud_init.log
sudo curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
#
# Install Terraform 
#
# sudo echo "[$(date +%F_%T)] Installing Terraform" >> ado_cloud_init.log
# sudo wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
# sudo unzip terraform*.zip
# sudo mv terraform /usr/local/bin
#
# Install SQLPackage for Linux and make it executable
#
sudo echo "[$(date +%F_%T)] Installing SQLPackage" >> ado_cloud_init.log
sudo curl -Lq https://go.microsoft.com/fwlink/?linkid=2165213 -o sqlpackage-linux-x64-latest.zip
sudo unzip sqlpackage-linux-x64-latest.zip -d /opt/sqlpackage
sudo chmod a+x /opt/sqlpackage/sqlpackage  
# 
# Install PowerShell Core and associated Modules
#
sudo echo "[$(date +%F_%T)] Installing PowerShell Core" >> ado_cloud_init.log
sudo wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo add-apt-repository universe
sudo apt-get install -y powershell 
# Install Powershell Modules
sudo echo "[$(date +%F_%T)] Installing PowerShell Modules" >> ado_cloud_init.log
sudo pwsh -Command "Install-Module -Name Az -Force"
sudo pwsh -Command "Install-Module -Name Pester -Force"
sudo pwsh -Command "Install-Module -Name Az.ResourceGraph -Force"
#
# Install Packer
#
# sudo echo "[$(date +%F_%T)] Installing Packer" >> ado_cloud_init.log
# sudo wget "https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip"
# sudo unzip packer*.zip
# sudo mv packer* /usr/local/bin
