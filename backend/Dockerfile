FROM ruby:2.6

ENV TZ='Asia/Tokyo'
RUN apt update -qq &&\
    apt install -y build-essential libpq-dev nodejs vim &&\
    gem update bundler

WORKDIR /backend

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install --without development test

COPY . .

RUN chmod +x scripts/start_server.sh
CMD bash scripts/start_server.sh
