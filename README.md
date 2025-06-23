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