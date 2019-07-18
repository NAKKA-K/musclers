FROM ruby:2.6

ENV TZ='Asia/Tokyo'
RUN apt-get update -qq &&\
    apt install -y build-essential libpq-dev nodejs &&\
    mkdir /backend

WORKDIR /backend

#COPY ./backend/Gemfile /backend/Gemfile
#COPY ./backend/Gemfile.lock /backend/Gemfile.lock

#RUN bundle install

#COPY ./backend /backend
CMD [ "echo", "app server" ]