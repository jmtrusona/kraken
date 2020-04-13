# frozen_string_literal: true

module Kraken
  module Changelog
    class Release
      attr_accessor :version, :release_date, :changeset

      def initialize(version:, release_date:, changeset: Changeset.new)
        @version = version
        @release_date = release_date
        @changeset = changeset
      end

      def tag
        return 'master' if @version == 'Unreleased'

        @version
      end

      def to_md
        "## #{release_header}\n\n" \
        "#{changeset.to_md}"
      end

      def to_s
        "Version: #{@version}\n" \
        "Released: #{release_date}\n" \
        "#{changeset}"
      end

      private

      def release_header
        return "[#{@version}] - #{@release_date}" if @release_date

        "[#{@version}]"
      end
    end
  end
end
