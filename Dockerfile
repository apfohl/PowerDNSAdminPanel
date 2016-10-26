FROM ruby:latest
MAINTAINER Andreas Pfohl <mail@apfohl.com>

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV RAILS_ENV production
ENV SECRET_KEY_BASE build-secret
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install --deployment --without development test
COPY . /usr/src/app
RUN bundle exec rake assets:precompile

EXPOSE 3000
