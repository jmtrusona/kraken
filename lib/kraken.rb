# frozen_string_literal: true

require 'kraken'
require 'thor'

module Kraken
  class Error < StandardError; end

  class CLI < Thor
    desc 'hello', 'sup?'
    def hello
      puts 'yes? can I help you?'
    end
  end
end
