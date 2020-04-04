# frozen_string_literal: true

require 'octokit'

module Kraken
  module GitHub
    class Service
      def initialize
        @github = client
      end

      def release(project:, release_notes:, release_card: nil, release_time: Time.now)
        release_tag = generate_release_tag(release_time, release_card)
        release_name = generate_release_name(project, release_time)
        @github.create_release(project.repo,
                               release_tag,
                               name: release_name,
                               release_tag: release_tag,
                               target_commitish: 'master',
                               body: release_notes,
                               draft: true)
        release_name
      end

      private

      def client
        Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
      end

      def generate_release_tag(release_time, release_card)
        return release_time_tag(release_time) unless release_card

        release_card_tag(release_time, release_card)
      end

      def release_time_tag(release_time)
        "release-#{release_time.strftime('%Y%m%d-%H%M%S')}"
      end

      def release_card_tag(release_time, release_card)
        "release-#{release_time.strftime('%Y%m%d')}-trello-#{release_card}"
      end

      def generate_release_name(project, release_time)
        "#{project.name} Release - #{release_time.strftime('%Y-%m-%d')}"
      end
    end
  end
end
