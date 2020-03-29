# frozen_string_literal: true

require 'subcommand_base'
require 'changelog/service'

module Kraken
  module Changelog
    class Commands < SubcommandBase
      desc 'view', 'Displays the release details in the CHANGELOG.md for current directory'
      def view(_service = Kraken::Changelog::Service.new)
        # release = service.parse
        # puts release.to_s
        puts 'under construction'
      end
    end
  end
end
