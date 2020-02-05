FROM node:12-alpine

ENV TZ='Asia/Tokyo'
WORKDIR /frontend

RUN apk update &&\
    apk add curl python make g++ &&\
    npm install -g @vue/cli

COPY package*.json ./

RUN npm install
COPY . .
#RUN npm run build

RUN chmod +x scripts/start_server.sh
CMD ash scripts/start_server.sh
