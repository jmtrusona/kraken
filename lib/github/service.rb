# frozen_string_literal: true

require 'octokit'
require 'github/model/tag'

module Kraken
  module GitHub
    class Error < StandardError; end

    class Service
      def initialize
        @github = client
      end

      def list_tags(organization, repository)
        # TODO: pagination may be preventing tags from getting listed
        all_refs = @github.refs("#{organization}/#{repository}")
        tags = all_refs.select { |ref| ref.ref.start_with?('refs/tags/') }

        tags.map do |tag|
          name = tag.ref.delete_prefix('refs/tags/')
          Kraken::GitHub::Tag.new(name: name)
        end
      end

      private

      def client
        Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
      end
    end
  end
end
