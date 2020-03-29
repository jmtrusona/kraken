# frozen_string_literal: true

require 'subcommand_base'
require 'git/wrapper'

module Kraken
  module Git
    class Commands < SubcommandBase
      desc 'whoami', 'Displays the git repo for current directory'
      def whoami(service = Kraken::Git::Wrapper.new)
        puts "I am #{service.remote_url}"
      end
    end
  end
end
