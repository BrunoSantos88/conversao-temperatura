#!/bin/bash
#instalaçao ubuntu 20:04 java
sudo curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
sudo apt install default-jre -y 
##dependencias
sudo apt install maven -y
sudo apt  install docker.io -y
sudo apt-get install jq -y
sudo apt install git -y 
sudo apt install wget -y
# install Jenkins
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
#alterar port jenkins
sudo sed -i -e 's/Environment="JENKINS_PORT=[0-9]\+"/Environment="JENKINS_PORT=8081"/' /usr/lib/systemd/system/jenkins.service
#commandos jenkins
sudo systemctl start jenkins
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
##AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo apt install unzip -y
sudo unzip awscliv2.zip  
sudo ./aws/install
#kubectl commmados
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
sudo cp kubectl /usr/local/bin/
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
#apos docker
sudo usermod -aG docker $USER
sudo newgrp docker
sudo usermod -aG docker jenkins
sudo newgrp docker
sudo service jenkins restart
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
#datadogAgente
sudo DD_API_KEY=dbd1f53ed0e22eb73454b59608d40690 DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"
sudo systemctl start datadog-agent
#terraform
sudo apt-get install wget curl unzip software-properties-common gnupg2 -y
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y
sudo apt-get install terraform -y
#ZAP is isntalled at /home/ec2-user/ZAP_2.11.1/zap.sh
sudo wget https://github.com/zaproxy/zaproxy/releases/download/v2.11.1/ZAP_2_11_1_unix.sh
sudo chmod +x ZAP_2_11_1_unix.sh 
sudo ./ZAP_2_11_1_unix.sh -q
sudo tar -xvf ZAP_2.11.1_Linux.tar.gz
#install nodejs
sudo curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs