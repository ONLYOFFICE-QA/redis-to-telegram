# frozen_string_literal: true

require 'spec_helper'

describe RedisToTelegram::RedisMessageFetcher do
  let(:redis_message_fetcher) { described_class.new }
  let(:messages) {  redis_message_fetcher.fetch_messages }

  it 'return empty array for empty redis connection' do
    expect(redis_message_fetcher.fetch_messages).to eq([])
  end

  it 'return array of messages after some data push' do
    push_message_to_redis({notification: 'text', chat: '-123'})
    expect(messages.first.text).to eq(RedisToTelegram::Message.new('text', '-12345').text)
  end

  it 'return array of message even if there is nil in middle' do
    push_message_to_redis({notification: 'text', chat: '-123'})
    push_message_to_redis({})
    push_message_to_redis({notification: 'text2', chat: '-1232'})
    expect(messages.length).to eq(3)
  end
end
