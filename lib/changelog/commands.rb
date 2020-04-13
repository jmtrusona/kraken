# frozen_string_literal: true

require 'subcommand_base'
require 'changelog/service'

module Kraken
  module Changelog
    class Commands < SubcommandBase
      desc 'view', 'Displays the release details in the CHANGELOG.md for current directory'
      method_option :output, aliases: '-o', enum: %w[markdown]
      def view(service = Kraken::Changelog::Service.new)
        log = service.parse

        puts log.to_output options[:output]
      end
    end
  end
end
