FROM ruby:2.7.2-alpine3.12

RUN apk add --update \
        build-base \
        postgresql-client \
        postgresql-dev \
        ruby-dev \
        && rm -rf /var/cache/apk/*

RUN bundle config --global frozen 1

WORKDIR /srv/app
COPY git-source/ .
RUN gem install rails bundler
RUN bundle install

CMD bundle exec rails server -b 0.0.0.0
