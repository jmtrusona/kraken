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

      def to_md
        "## [#{@version}] - #{@release_date}\n\n" \
        "#{changeset.to_md}"
      end

      def to_s
        "Version: #{@version}\n" \
        "Released: #{release_date}\n" \
        "#{changeset}"
      end
    end
  end
end
