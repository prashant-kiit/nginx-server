FROM node:latest

WORKDIR /app

COPY dist/ ./dist
COPY node_modules/ ./node_modules
COPY package.json .

EXPOSE 8000

ENTRYPOINT ["npm", "start"]