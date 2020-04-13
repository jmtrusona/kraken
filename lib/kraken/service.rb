# frozen_string_literal: true

module Kraken
  class Service
    include Thor::Base
    include Thor::Actions

    def initialize
      @git = Kraken::Git::Service.new
      @github = Kraken::GitHub::Service.new
    end

    def release
      org, repo = @git.org_and_repo

      project = Kraken::GitHub::Project.new(organization: org, repository: repo)

      return unless yes? "Would you like to release #{project}?"

      release = Kraken::GitHub::Release.new(project: project,
                                            release_card: gather_release_card,
                                            release_notes: gather_release_notes)

      return unless release_confirmation(release)

      github_release_url = @github.perform_release(release)

      say "\nAsk Product to publish the release at:\n\n  #{github_release_url}\n\nThanks!"
    end

    private

    def gather_release_card
      ask 'What is the Trello release card number?'
    end

    def gather_release_notes
      release_notes = []
      release_notes << ask('What was in this release?')
      release_notes << ask('What else was in this release?') while yes?('Anything else?')
      release_notes.join("\n")
    end

    def release_confirmation(release)
      say release.confirmation_message
      yes? 'Does this look good?'
    end
  end
end
