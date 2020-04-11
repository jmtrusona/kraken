# frozen_string_literal: true

module Kraken
  module Changelog
    class Changeset
      attr_accessor :changes

      def initialize(changes: [])
        @changes = changes.reject { |change| cleanup(change.description).empty? }
      end

      def to_s
        out = ''
        changes.group_by(&:type).sort.each do |type, changes|
          out += "#{type}:\n"
          out += changes.map { |change| "- #{change.description}\n" }.join
        end
        out
      end

      private

      def cleanup(string)
        string.gsub("\n", '').strip
      end
    end
  end
end
