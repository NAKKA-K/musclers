FROM node:12-alpine

ENV TZ='Asia/Tokyo'
WORKDIR /frontend

RUN apk update &&\
    apk add curl python make g++ &&\
    npm install -g @vue/cli

COPY package*.json ./

RUN npm install
COPY . .

ARG api_url
ARG api_url_browser
ARG ws_url
ARG facebook_app
ARG node_env

ENV API_URL=$api_url
ENV API_URL_BROWSER=$api_url_browser
ENV WS_URL=$ws_url
ENV FACEBOOK_APP=$facebook_app
ENV NODE_ENV=$node_env

RUN npm run build
ENV FACEBOOK_APP=' '

CMD ["npm","run","start"]
