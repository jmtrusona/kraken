# frozen_string_literal: true

require 'subcommand_base'
require 'git/service'

module Kraken
  module Git
    class Commands < SubcommandBase
      desc 'whoami', 'Displays the git repo for current directory'
      def whoami(git = Kraken::Git::Service.new)
        puts "I am #{git.remote_url}"
      end

      desc 'tags', 'List the tags for the git repo for current directory'
      def tags(git = Kraken::Git::Service.new)
        puts 'Tags'
        git_tags = git.list_tags
        git_tags.each do |git_tag|
          puts "- #{git_tag.name}"
        end
      end
    end
  end
end
