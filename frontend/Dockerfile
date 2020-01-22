FROM node:12-alpine

ENV TZ='Asia/Tokyo'
WORKDIR /frontend

RUN apk update &&\
    apk add curl &&\
    npm install -g @vue/cli

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

CMD npm run start
