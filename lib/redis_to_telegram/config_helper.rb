# frozen_string_literal: true

require 'yaml'

module RedisToTelegram
  # Class for work with config
  class ConfigHelper
    def initialize(path = 'config.yml')
      @path = path
    end

    # @return [Hash] Parsed config data
    def config
      YAML.load_file(@path)
    end
  end
end
