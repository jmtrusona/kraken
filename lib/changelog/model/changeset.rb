# frozen_string_literal: true

module Kraken
  module Changelog
    class Changeset
      attr_accessor :changes

      def initialize(changes: [])
        @changes = changes.reject { |change| cleanup(change).empty? }
      end

      def to_s
        "Changes:\n" \
        "#{changes.map { |change| "- #{change}" }.join("\n")}"
      end

      private

      def cleanup(string)
        string.gsub("\n", '').strip
      end
    end
  end
end
