# frozen_string_literal: true

module Kraken
  module GitHub
    class Project
      attr_accessor :organization, :repository, :name

      def initialize(organization:, repository:, name: nil)
        @organization = organization
        @repository = repository
        @name = name || project_name
      end

      def to_s
        "#{name} (#{organization}/#{repository})"
      end

      private

      def project_name
        return @repository.split('-').map(&:capitalize).join(' ') if @repository

        'Unknown'
      end
    end
  end
end
