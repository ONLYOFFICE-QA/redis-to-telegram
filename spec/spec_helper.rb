# frozen_string_literal: true

require 'json'
require 'redis_to_telegram'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

# Push data to redis
def push_message_to_redis(data)
  Redis.new.lpush('sinatra_commands', data.to_json)
end
