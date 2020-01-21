FROM node:12-alpine

ENV TZ='Asia/Tokyo'
WORKDIR /frontend

RUN apk update &&\
    apk add curl &&\
    npm install -g @vue/cli

COPY package*.json ./

RUN npm install

COPY . .

RUN chmod +x scripts/npm_start_server.sh
CMD bash scripts/npm_start_server.sh
