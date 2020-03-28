# frozen_string_literal: true

require 'kraken'
require 'kraken/version'

require 'thor'
require 'git/commands'
require 'github/commands'
require 'kubernetes/commands'
require 'trello/commands'

module Kraken
  class Error < StandardError; end

  class CLI < Thor
    desc 'version', 'Display the version'
    def version
      puts Kraken::VERSION
    end

    desc 'github', 'Run commands related to GitHub'
    subcommand 'github', Kraken::GitHub::Commands

    desc 'git', 'Run commands related to git'
    subcommand 'git', Kraken::Git::Commands

    desc 'kubernetes', 'Run commands related to Kubernetes'
    subcommand 'kubernetes', Kraken::Kubernetes::Commands

    desc 'trello', 'Run commands related to Trello'
    subcommand 'trello', Kraken::Trello::Commands
  end
end
