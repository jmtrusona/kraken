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
        contents = @changelog.readlines.reject { |s| s.strip.empty? }.join("\n")
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

      def parse_release(section)
        version, release_date = parse_release_header(section.split("\n").first)
        changes = parse_changes(section.split("\n")[1..-1].join("\n"))

        Kraken::Changelog::Release.new(version: version,
                                       release_date: release_date,
                                       changeset: Kraken::Changelog::Changeset.new(changes: changes))
      end

      def parse_release_header(header)
        # [0.10.0] - March 29, 2020
        version, release_date = header.split('-')
        [
          version.strip.delete_prefix('[').delete_suffix(']'),
          release_date.strip
        ]
      end

      def parse_changes(body)
        changes = []
        body.split(/^### /).each do |group|
          next if group.strip.delete_suffix("\n").empty?

          changes += group.split("\n")[1..-1].join("\n").split(/^\- /).reject { |s| s.strip.empty? }.map do |change|
            strip_url_references(change)
          end
        end
        changes
      end

      def strip_url_references(change)
        change.split("\n").reject { |line| line.match?(/^\[/) }.join("\n")
      end
    end
  end
end
