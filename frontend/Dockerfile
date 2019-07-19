FROM node:12-alpine

ENV TZ='Asia/Tokyo'
RUN apk update &&\
    npm install -g npm &&\
    npm install -g @vue/cli

WORKDIR /frontend

COPY package.json /frontend
COPY package-lock.json /frontend
RUN npm install

COPY . /frontend