FROM ruby:3.0.4

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES=1
ENV RAILS_LOG_TO_STDOUT true

RUN rails assets:precompile

CMD rails s -b 0.0.0.0
