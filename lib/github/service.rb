# frozen_string_literal: true

require 'octokit'

module Kraken
  module GitHub
    class Service
      def initialize
        @github = client
      end

      def perform_release(release)
        github_release = @github.create_release("#{release.project.organization}/#{release.project.repository}",
                                                release.release_tag,
                                                name: release,
                                                release_tag: release.release_tag,
                                                target_commitish: 'master',
                                                body: release.release_notes,
                                                draft: true)
        github_release[:html_url]
      end

      private

      def client
        Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
      end
    end
  end
end
