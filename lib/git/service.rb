# frozen_string_literal: true

require 'git'

module Kraken
  module Git
    class Error < StandardError; end

    class Service
      def initialize(git = ::Git.open('.'))
        @git = git
      end

      def remote_url
        @git.remote.url
      end
    end
  end
end
