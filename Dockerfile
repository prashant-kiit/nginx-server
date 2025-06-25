FROM node:latest

WORKDIR /server

COPY dist/ ./dist
COPY package.json .

RUN npm install

EXPOSE 8000

ENTRYPOINT ["npm", "start"]