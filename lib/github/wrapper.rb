# frozen_string_literal: true

require 'octokit'
require 'github/model/tag'

module Kraken
  module GitHub
    class Error < StandardError; end

    class Wrapper
      def initialize(client = nil)
        @client = client || real_client
      end

      def list_tags(organization, repository)
        # TODO: pagination may be preventing tags from getting listed
        all_refs = @client.refs("#{organization}/#{repository}")
        tags = all_refs.select { |ref| ref.ref.start_with?('refs/tags/') }

        tags.map do |tag|
          name = tag.ref.delete_prefix('refs/tags/')
          Kraken::GitHub::Tag.new(name: name)
        end
      end

      private

      def real_client
        Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
      end
    end
  end
end
