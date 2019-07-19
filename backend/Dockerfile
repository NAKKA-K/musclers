FROM ruby:2.6

ENV TZ='Asia/Tokyo'
RUN apt-get update -qq &&\
    apt install -y build-essential libpq-dev nodejs &&\
    mkdir /backend &&\
    gem update bundler

WORKDIR /backend

COPY Gemfile /backend/Gemfile
COPY Gemfile.lock /backend/Gemfile.lock

RUN bundle install

COPY . /backend

CMD ["bundle", "exec", "rails", "s", "-p", "8080", "-b", "0.0.0.0"]