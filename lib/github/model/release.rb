# frozen_string_literal: true

module Kraken
  module GitHub
    class Release
      attr_accessor :project, :release_card, :release_notes, :release_time

      def initialize(project:, release_card: nil, release_notes: '', release_time: Time.now)
        @project = project
        @release_card = release_card
        @release_notes = release_notes
        @release_time = release_time
      end

      def to_s
        "#{@project.name} Release - #{@release_time.strftime('%Y-%m-%d')}"
      end

      def release_tag
        return generate_release_time_tag unless @release_card

        generate_release_card_tag
      end

      def confirmation_message
        "\nCreating Release for #{@project}:\n\n" \
        "Name: #{self}\n" \
        "Tag: #{release_tag}\n" \
        "Description:\n" \
        "#{@release_notes}\n\n"
      end

      private

      def generate_release_time_tag
        "release-#{@release_time.strftime('%Y%m%d-%H%M%S')}"
      end

      def generate_release_card_tag
        "release-#{@release_time.strftime('%Y%m%d')}-trello-#{@release_card}"
      end
    end
  end
end
