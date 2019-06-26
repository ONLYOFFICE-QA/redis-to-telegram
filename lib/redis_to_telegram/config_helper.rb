# frozen_string_literal: true

require 'yaml'

module RedisToTelegram
  # Class for work with config
  class ConfigHelper
    def self.config
      YAML.load_file('config.yml')
    end
  end
end
