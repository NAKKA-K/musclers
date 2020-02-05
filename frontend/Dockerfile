FROM node:12-alpine

ENV TZ='Asia/Tokyo'
WORKDIR /frontend

RUN apk update &&\
    apk add curl python make g++ &&\
    npm install -g @vue/cli

COPY package*.json ./

RUN npm install
COPY . .

ARG facebook_app
ENV FACEBOOK_APP=$facebook_app
RUN npm run build
ENV FACEBOOK_APP=' '

CMD ["npm","run","start"]
