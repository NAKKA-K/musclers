FROM node:12-alpine

ENV TZ='Asia/Tokyo'
WORKDIR /frontend

RUN apk update &&\
    apk add curl python make g++ &&\
    npm install -g @vue/cli

COPY package*.json ./

COPY . .
