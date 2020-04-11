# frozen_string_literal: true

module Kraken
  module Changelog
    class Log
      attr_accessor :releases

      def initialize(releases: [])
        @releases = releases
      end

      def to_md
        "#{md_header}\n" \
        "#{md_body}\n"
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
    end
  end
end
