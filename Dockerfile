FROM ruby:2.4.1

RUN apt-get update && \
    apt-get -y install redis-server
COPY . /root/redis-to-telegram
WORKDIR /root/redis-to-telegram
RUN bundle install --without development
EXPOSE 80
CMD service redis-server start && \
    ruby app.rb