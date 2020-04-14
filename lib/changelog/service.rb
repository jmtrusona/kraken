# frozen_string_literal: true

require 'git'
require 'changelog/model/changeset'
require 'changelog/model/change'
require 'changelog/model/log'
require 'changelog/model/release'

module Kraken
  module Changelog
    class Service
      def initialize(changelog = open_changelog)
        @changelog = changelog
      end

      def parse
        contents = @changelog.readlines.reject { |s| s.strip.empty? }.join("\n")

        organization, repository = determine_org_and_repo(contents)
        log = Kraken::Changelog::Log.new(
          organization: organization,
          repository: repository
        )
        contents.split(/^## /).each do |section|
          next if section.match?(/^# Changelog/) # Skip header

          log.releases << parse_release(section)
        end
        log
      end

      private

      def open_changelog
        File.open('CHANGELOG.md')
      end

      def determine_org_and_repo(contents)
        contents.split("\n").each do |line|
          next unless line.include?(']: https://github.com/')

          # FIXME: hacky way of figuring out the org and repo from the CHANGELOG.md only
          return line.split(']: https://github.com/')[1].split('/')[0..1]
        end
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
          release_date&.strip
        ]
      end

      def parse_changes(body)
        changes = []
        body.split(/^### /).each do |group|
          next if group.strip.delete_suffix("\n").empty?

          group_type = cleanup(group.split(/^-/)[0])
          group.split(/^-/)[1..-1].each do |change|
            changes << Kraken::Changelog::Change.new(type: group_type,
                                                     description: cleanup(change))
          end
        end
        changes
      end

      def strip_url_references(change)
        change.split("\n").reject { |line| line.match?(/^\[/) }.join("\n")
      end

      def cleanup(string)
        # FIXME: gsub(/\[.*$/, '') is a hack to clean up footer URL refs
        string.gsub("\n", '').gsub(/\[.*$/, '').gsub(/\s+/, ' ').strip
      end
    end
  end
end
