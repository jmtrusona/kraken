# frozen_string_literal: true

require 'subcommand_base'
require 'github/service'
require 'github/model/project'
require 'github/model/release'

module Kraken
  module GitHub
    class Commands < SubcommandBase
      desc 'release', 'Creates a release in GitHub for a project'
      option :organization, default: 'jmtrusona'
      option :project, default: 'kraken'
      option :card, default: nil
      def release(github = Kraken::GitHub::Service.new)
        project = Kraken::GitHub::Project.new(
          organization: options[:organization],
          repository: options[:project]
        )
        release = Kraken::GitHub::Release.new(
          project: project,
          release_card: options[:card]
        )
        github_release_url = github.perform_release(release)
        puts "Created #{github_release_url}"
      end
    end
  end
end
