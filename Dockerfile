FROM ruby:3.1.1-alpine

COPY . /root/redis-to-telegram
WORKDIR /root/redis-to-telegram
RUN bundle config set without 'development test' && \
    bundle install
EXPOSE 80
CMD REDIS=redis ruby redis_to_telegram.rb
