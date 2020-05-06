FROM ruby:2.7-alpine

COPY . /root/redis-to-telegram
WORKDIR /root/redis-to-telegram
RUN bundle config set without 'development test'
RUN bundle install
EXPOSE 80
CMD bash -c "REDIS=redis ruby redis_to_telegram.rb"
