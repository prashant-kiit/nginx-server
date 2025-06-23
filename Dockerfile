FROM ubuntu:latest

RUN apt update
RUN apt install -y nodejs
RUN node -v
RUN apt install -y npm
RUN npm install -g pnpm@latest-10
RUN pnpm -v
RUN npm install -g typescript

WORKDIR /app

COPY package.json .

RUN pnpm install

COPY . .

RUN pnpm build

EXPOSE 3000

ENTRYPOINT ["pnpm", "start"]