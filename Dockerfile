FROM ruby:3.0.4

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install



RUN RAILS_ENV=production rails assets:precompile
ENV RAILS_SERVE_STATIC_FILES=1

CMD RAILS_ENV=production rails s -b 0.0.0.0
