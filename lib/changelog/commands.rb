# frozen_string_literal: true

require 'subcommand_base'
require 'changelog/service'

module Kraken
  module Changelog
    class Commands < SubcommandBase
      desc 'view', 'Displays the release details in the CHANGELOG.md for current directory'
      def view(service = Kraken::Changelog::Service.new)
        releases = service.parse
        releases.each do |release|
          puts release.to_s
        end
      end
    end
  end
end
