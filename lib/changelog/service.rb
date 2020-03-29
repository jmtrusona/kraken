# frozen_string_literal: true

require 'git'
require 'changelog/model/release'
require 'changelog/model/changeset'

module Kraken
  module Changelog
    class Service
      def initialize
        @changelog = open_changelog
      end

      def parse
        releases = []
        contents = @changelog.read
        contents.split(/^## /).each do |section|
          next if section.match?(/^# Changelog/) # Skip header

          releases << parse_release(section)
        end
        releases
      end

      private

      def open_changelog
        File.open('CHANGELOG.md')
      end

      def parse_release(_section)
        Kraken::Changelog::Release.new(version: '0.1.0')
      end
    end
  end
end
