# frozen_string_literal: true

require 'thor'
require 'thor/hollaback'

require 'kraken'
require 'kraken/service'
require 'kraken/version'

require 'changelog/commands'
require 'git/commands'
require 'github/commands'
require 'kubernetes/commands'
require 'trello/commands'

module Kraken
  class CLI < Thor
    include Thor::Actions
    class_around :safe_execute

    desc 'version', 'Display the version'
    def version
      say Kraken::VERSION
    end

    desc 'release', 'Run the release of the current directory project'
    def release
      kraken = Kraken::Service.new
      kraken.release
    end

    desc 'changelog', 'Run commands related to CHANGELOG.md'
    subcommand 'changelog', Kraken::Changelog::Commands

    desc 'github', 'Run commands related to GitHub'
    subcommand 'github', Kraken::GitHub::Commands

    desc 'git', 'Run commands related to git'
    subcommand 'git', Kraken::Git::Commands

    desc 'kubernetes', 'Run commands related to Kubernetes'
    subcommand 'kubernetes', Kraken::Kubernetes::Commands

    desc 'trello', 'Run commands related to Trello'
    subcommand 'trello', Kraken::Trello::Commands

    no_commands do
      def safe_execute
        yield
      rescue Interrupt
        warn "\nExiting the current command. Goodbye!"
        exit 1
      rescue MissingEnvError, StandardError => e
        warn "#{e.message}\nGoodbye!"
        exit 1
      end
    end
  end
end
