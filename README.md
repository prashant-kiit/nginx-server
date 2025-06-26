# nginx-server

# command to run container
> docker build -t express-server .
> docker compose up -d

# command for terraform
> terraform init
> terraform plan
> terraform apply
> terrform destroy

# manual deployment steps (as we on jenkins server):
---one-time----
> terraform init
> terraform apply -auto-approve
---domain name is needed---
---one-time---
> eval "$(ssh-agent -s)"
> ssh-add ~/.ssh/id_rsa_aws
---paraphrase issue---
> ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_aws ubuntu@ec2-44-201-166-48.compute-1.amazonaws.com
> git --version
    > sudo apt update -y
    > sudo apt install -y libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc
    > sudo apt install -y git
    > sudo apt update -y
    > git --version
> docker --version
    > sudo apt-get install -y ca-certificates curl
    > sudo install -m 0755 -d /etc/apt/keyrings
    > sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    > sudo chmod a+r /etc/apt/keyrings/docker.asc
    > echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    > sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    > sudo apt update -y
    > docker --version
> cd nginx-server
    > git clone https://github.com/prashant-kiit/nginx-server.git
    > cd nginx-server
> git pull origin master
> sudo docker compose up -d --build 


# optimized manual pipeline
> npm install
> npm run build
> docker build --platform linux/amd64 -t express-server .
> echo "Prashant123#" | docker login --username "prashantdocker090798" --password-stdin
> docker tag prashantdocker090798/express-server prashantdocker090798/express-server:latest
> docker push prashantdocker090798/express-server:latest
> ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_aws ubuntu@ec2-3-87-2-173.compute-1.amazonaws.com
> docker --version
    > sudo apt-get install -y ca-certificates curl
    > sudo install -m 0755 -d /etc/apt/keyrings
    > sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    > sudo chmod a+r /etc/apt/keyrings/docker.asc
    > echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    > sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
> cd nginx-server
    > git clone https://github.com/prashant-kiit/nginx-server.git
    > cd nginx-server
> echo "Prashant123#" | docker login --username "prashantdocker090798" --password-stdin
> docker pull prashantdocker090798/express-server:latest
> docker stop $(docker ps -q)
> docker compose up -d

# monitoring
> sudo docker logs -f nginx-proxy


## Provision Infrastructure and its Configuration

# SSH into EC2
> ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_aws ubuntu@ec2-54-235-224-111.compute-1.amazonaws.com

# Install Node
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
> \. "$HOME/.nvm/nvm.sh"
> nvm install 22

# Install Docker
> sudo apt-get install -y ca-certificates curl
> sudo install -m 0755 -d /etc/apt/keyrings
> sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
> sudo chmod a+r /etc/apt/keyrings/docker.asc
> echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
> sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Login in Docker
> echo "Prashant123#" | docker login --username "prashantdocker090798" --password-stdin
> sudo usermod -aG docker $USER
> newgrp docker

# CICD
> ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_aws ubuntu@ec2-3-87-2-173.compute-1.amazonaws.com
> cd nginx-server
    > git clone https://github.com/prashant-kiit/nginx-server.git
    > cd nginx-server
> docker pull prashantdocker090798/express-server:latest
> docker compose up -d

# monitoring
> sudo docker logs -f nginx-proxy