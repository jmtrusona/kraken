# frozen_string_literal: true

require 'git'

module Kraken
  module Git
    class Error < StandardError; end

    class Service
      def initialize(service = nil)
        @git = service || real_service
      end

      def remote_url
        @git.remote.url
      end

      private

      def real_service
        ::Git.open('.')
      end
    end
  end
end
