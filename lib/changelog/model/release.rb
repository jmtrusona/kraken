# frozen_string_literal: true

module Kraken
  module Changelog
    class Release
      attr_accessor :version, :changeset

      def initialize(version:, changeset: Changeset.new)
        @version = version
        @changeset = changeset
      end

      def to_s
        "Version: #{@version}"
      end
    end
  end
end
