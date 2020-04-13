# frozen_string_literal: true

require 'octokit'

require 'error/missing_env_error'

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
        raise MissingEnvError, access_token_key unless access_token_exists?

        Octokit::Client.new(access_token: access_token)
      end

      def access_token_exists?
        access_token&.strip != ''
      end

      def access_token
        ENV[access_token_key]
      end

      def access_token_key
        'GITHUB_TOKEN'
      end
    end
  end
end
