# frozen_string_literal: true

require 'redis'

module RedisToTelegram
  # Stuff for Message
  class Message
    # @return [String] chat message
    attr_reader :text
    # @return [Integer] chat id to send message
    attr_reader :chat_id

    def initialize(text, chat_id)
      @text = text
      @chat_id = chat_id
    end

    # @param [Message] other to compare
    # @return [Boolean] result of compare
    def ==(other)
      @text == other.text &&
        @chat_id == other.chat_id
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
      "`Message: #{@text}` " \
        "`To Chat: #{@chat_id}`"
    end
  end
end
