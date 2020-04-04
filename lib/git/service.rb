# frozen_string_literal: true

require 'git'

module Kraken
  module Git
    class Service
      def initialize
        @git = client
      end

      def remote_url
        @git.remote.url
      end

      private

      def client
        ::Git.open('.')
      end
    end
  end
end
