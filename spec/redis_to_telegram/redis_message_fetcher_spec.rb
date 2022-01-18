# frozen_string_literal: true

require 'spec_helper'

describe RedisToTelegram::RedisMessageFetcher do
  let(:config) { RedisToTelegram::ConfigHelper.new('spec/data/fake_config.yml')}
  let(:redis_message_fetcher) { described_class.new(config: config) }
  let(:messages) {  redis_message_fetcher.fetch_messages }

  it 'return empty array for empty redis connection' do
    expect(redis_message_fetcher.fetch_messages).to eq([])
  end

  it 'return array of messages after some data push' do
    push_message_to_redis({notification: 'text', chat: 'fake_telegram_chat_id'})
    expect(messages.first).to eq(RedisToTelegram::Message.new('text', -12345))
  end

  it 'return array of message even if there is nil in middle' do
    push_message_to_redis({notification: 'text', chat: 'fake_telegram_chat_id'})
    push_message_to_redis({})
    push_message_to_redis({notification: 'text2', chat: 'fake_telegram_chat_id'})
    expect(messages.length).to eq(3)
  end
end
