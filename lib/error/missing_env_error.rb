# frozen_string_literal: true

module Kraken
  class MissingEnvError < StandardError
    attr_reader :env_key

    def initialize(env_key)
      @env_key = env_key
      super("Missing a value for #{env_key} which is required. Please add with a valid value and try again.")
    end
  end
end
