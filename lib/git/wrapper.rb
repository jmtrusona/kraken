# frozen_string_literal: true

require 'git'

module Kraken
  module Git
    class Wrapper
      def initialize(client: real_client)
        @git = client
      end

      def remote_url
        @git.remote.url
      end

      private

      def real_client
        ::Git.open('.')
      end
    end
  end
end
