# frozen_string_literal: true

require_relative 'redis_message_fetcher/message'

module RedisToTelegram
  # Code to fetch message data from Redis
  class RedisMessageFetcher
    def initialize(host: ENV.fetch('REDIS', 'localhost'), config: ConfigHelper.new)
      @redis = Redis.new(host:)
      @config = config
    end

    # @return [Array<Messages>] list of messages to handle
    def fetch_messages
      messages = []

      data = fetch_new_data
      while data
        messages << parse_message(data)
        data = fetch_new_data
      end

      messages
    end

    private

    # @return [Object] data from redis
    def fetch_new_data
      @redis.rpop('sinatra_commands')
    end

    # Parse data to message
    # @param [Object] data to parse
    # @return [Message]
    def parse_message(data)
      parsed = JSON.parse(data)
      text = parsed['notification']
      chat_id = fetch_chat_id(parsed['chat'])
      Message.new(text, chat_id)
    end

    # Fetch chat id from config
    # @param chat_name [String] name of chat
    # @return [String] id of chat
    def fetch_chat_id(chat_name)
      @config.data[chat_name]
    end
  end
end
