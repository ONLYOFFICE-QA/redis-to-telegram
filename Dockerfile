FROM ruby:2.6

COPY . /root/redis-to-telegram
WORKDIR /root/redis-to-telegram
RUN bundle install --without development
EXPOSE 80
CMD bash -c "REDIS=redis ruby redis_to_telegram.rb"
