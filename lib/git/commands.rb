# frozen_string_literal: true

require 'subcommand_base'
require 'git/service'

module Kraken
  module Git
    class Commands < SubcommandBase
      desc 'whoami', 'Displays the git repo for current directory'
      def whoami(service = Kraken::Git::Service.new)
        puts "I am #{service.remote_url}"
      end
    end
  end
end
