# frozen_string_literal: true

module Kraken
  module Changelog
    class Log
      attr_accessor :releases

      def initialize(organization:, repository:, releases: [])
        @organization = organization
        @repository = repository
        @releases = releases
      end

      def to_output(type)
        case type
        when 'markdown'
          to_md
        else
          to_plain
        end
      end

      def to_plain
        @releases.map do |release|
          "#{release}" \
          '-----------'
        end.join("\n")
      end

      def to_md
        "#{md_header}\n" \
        "#{md_body}\n" \
        "#{md_footer}"
      end

      private

      def md_header
        %(# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
)
      end

      def md_body
        releases.map(&:to_md).join("\n")
      end

      def md_footer
        url_refs = []
        releases.each_with_index do |release, index|
          url_refs << generate_url_ref(releases, release, index)
        end
        url_refs.join("\n")
      end

      def generate_url_ref(releases, release, index)
        return tag_url_ref(release.version, release.tag) if index == first_release_index(releases)

        previous_release = previous_release(releases, index)
        compare_url_ref(release.version, previous_release.tag, release.tag)
      end

      def first_release_index(releases)
        releases.count - 1
      end

      def next_release_index(index)
        index + 1
      end

      def previous_release(releases, index)
        releases[next_release_index(index)]
      end

      def compare_url_ref(release_name, previous, current)
        "[#{release_name}]: https://github.com/#{@organization}/#{@repository}/compare/#{previous}...#{current}"
      end

      def tag_url_ref(release_name, current)
        "[#{release_name}]: https://github.com/#{@organization}/#{@repository}/releases/tag/#{current}"
      end
    end
  end
end
