# frozen_string_literal: true

module Kraken
  module GitHub
    class Project
      attr_accessor :organization, :project, :name

      def initialize(organization:, project:, name: nil)
        @organization = organization
        @project = project
        @name = name || project_name
      end

      def repo
        "#{organization}/#{project}"
      end

      private

      def project_name
        return @project.split('-').map(&:capitalize).join(' ') if @project

        'Unknown'
      end
    end
  end
end
