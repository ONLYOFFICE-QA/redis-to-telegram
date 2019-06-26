# frozen_string_literal: true

module RedisToTelegram
  # Helper for message
  module MessageHelper
    # Fetch chat id from config
    # @param chat_name [String] name of chat
    # @return [String] id of chat
    def fetch_chat_id(chat_name)
      ConfigHelper.config[chat_name]
    end
  end
end
