# frozen_string_literal: true

require 'subcommand_base'
require 'github/service'
require 'github/model/project'

module Kraken
  module GitHub
    class Commands < SubcommandBase
      desc 'release', 'Creates a release in GitHub for a project'
      option :organization, default: 'jmtrusona'
      option :project, default: 'kraken'
      option :card, default: nil
      def release(github = Kraken::GitHub::Service.new)
        release_name = github.release(
          project: Kraken::GitHub::Project.new(
            organization: options[:organization],
            project: options[:project]
          ),
          release_notes: 'See CHANGELOG.md for updates',
          release_card: options[:card]
        )
        puts "Created #{release_name}"
      end
    end
  end
end
