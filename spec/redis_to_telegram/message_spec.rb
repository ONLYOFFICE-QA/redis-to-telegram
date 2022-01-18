# frozen_string_literal: true

require 'spec_helper'

describe RedisToTelegram::Message do
  let(:message) { described_class.new('text', -123) }

  describe '#ready_to_send' do
    it 'ready_to_send true for correct message' do
      expect(message).to be_ready_to_send
    end

    it 'ready_to_send false for message without text' do
      expect(described_class.new(nil, -123)).not_to be_ready_to_send
    end

    it 'ready_to_send false for message without chat id' do
      expect(described_class.new('text', nil)).not_to be_ready_to_send
    end
  end

  describe '#to_s' do
    it 'to_s return string for correct message' do
      expect(message.to_s).to be_a(String)
    end

    it 'to_s return string for message without text' do
      expect(described_class.new(nil, -123).to_s).to be_a(String)
    end
  end
end
