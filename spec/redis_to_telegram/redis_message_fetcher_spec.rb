# frozen_string_literal: true

require 'spec_helper'

describe RedisToTelegram::RedisMessageFetcher do
  let(:redis_message_fetcher) { described_class.new(host: ENV['REDIS_HOST']) }

  it 'return empty array for empty redis connection' do
    expect(redis_message_fetcher.fetch_messages).to eq([])
  end
end
