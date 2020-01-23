FROM node:12-alpine

ENV TZ='Asia/Tokyo'
WORKDIR /frontend

RUN apk update &&\
    apk add curl &&\
    npm install -g @vue/cli

COPY package*.json ./

RUN npm cache clean --force && npm install

COPY . .

CMD npm run start
