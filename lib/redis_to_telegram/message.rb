# frozen_string_literal: true

require 'redis'
require_relative 'message/message_helper'

module RedisToTelegram
  # Stuff for Message
  class Message
    include MessageHelper

    # @return [String] chat message
    attr_accessor :text
    # @return [Integer] chat id to send message
    attr_accessor :chat_id

    # @param redis [Redis] from which fetch data
    def fetch(redis)
      data = redis.rpop('sinatra_commands')
      return self if data.nil?

      parsed = JSON.parse(data)
      @text = parsed['notification']
      @chat_id = fetch_chat_id(parsed['chat'])
      self
    end

    # Check if message ready to send
    # @return [True, False]
    def ready_to_send?
      return false if text.nil?
      return false if chat_id.nil?

      true
    end

    # @return [String] string of message
    def to_s
      "`Message: #{@text}` "\
        "`To Chat: #{@chat_id}`"
    end
  end
end
