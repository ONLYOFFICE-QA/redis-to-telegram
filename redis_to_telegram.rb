# frozen_string_literal: true

require 'telegram/bot'
require_relative 'lib/redis_to_telegram'

# App to send telegram messages
module RedisToTelegram
  redis_message_fetcher = RedisMessageFetcher.new

  Telegram::Bot::Client.run(ConfigHelper.config['telegram_bot_token'],
                            logger: Logger.new($stdout)) do |bot|
    loop do
      sleep 30
      messages = redis_message_fetcher.fetch_messages
      messages.each do |message|
        next unless message.ready_to_send?

        bot.api.send_message(chat_id: message.chat_id,
                             text: message.text)
        bot.logger.info("Message send: #{message}")
      end
    end
  end
end
