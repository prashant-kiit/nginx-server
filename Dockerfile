FROM node:latest

# RUN apt update
# RUN apt install -y nodejs
# RUN node -v
# RUN apt install -y npm
# RUN npm install -g pnpm@latest-10
# RUN pnpm -v
# RUN npm install -g typescript

WORKDIR /app

COPY dist/ ./dist
COPY node_modules/ ./node_modules
COPY package.json .

EXPOSE 8000

ENTRYPOINT ["npm", "start"]