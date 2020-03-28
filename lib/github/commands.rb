# frozen_string_literal: true

require 'subcommand_base'
require 'github/wrapper'

module Kraken
  module GitHub
    class Commands < SubcommandBase
      desc 'tags', 'List the GitHub tags for a project'
      option :organization, default: 'jmtrusona'
      option :repository, default: 'kraken'
      def tags(client = Kraken::GitHub::Wrapper.new)
        puts 'Tags'
        git_tags = client.list_tags(options[:organization], options[:repository])
        git_tags.each do |git_tag|
          puts "- #{git_tag.name}"
        end
      end
    end
  end
end
