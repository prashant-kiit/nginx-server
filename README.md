# nginx-server

# command to run container
> docker build -t nginx-server-app .
> docker run -d -p 8000:8000 --name nginx-server-app  nginx-server-app
OR
> docker compose up -d
OR
> docker compose up -d --build

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
> ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_aws ubuntu@ec2-34-238-255-177.compute-1.amazonaws.com
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

# monitoring
> sudo docker logs -f nginx-proxy