# frozen_string_literal: true

require 'git'
require 'git/model/tag'

module Kraken
  module Git
    class Service
      def initialize
        @git = client
      end

      def remote_url
        @git.remote.url
      end

      def org_and_repo
        remote_url.delete_prefix('git@github.com:').delete_suffix('.git').split('/')
      end

      def list_tags
        @git
          .tags
          .select { |tag| tag.name.match?(/^v[0-9]+\.[0-9]+\.[0-9]+/) }
          .map { |tag| tag.name.delete_prefix('v') }
          .sort_by { |version| Gem::Version.new(version) }
          .map { |version| Kraken::Git::Tag.new(name: version) }
      end

      private

      def client
        return @git if @git

        ::Git.open('.')
      end
    end
  end
end
