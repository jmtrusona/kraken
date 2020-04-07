# frozen_string_literal: true

require 'thor'

require 'kraken'
require 'kraken/version'

require 'changelog/commands'
require 'git/commands'
require 'github/commands'
require 'kubernetes/commands'
require 'trello/commands'

module Kraken
  class CLI < Thor
    include Thor::Actions

    desc 'version', 'Display the version'
    def version
      say Kraken::VERSION
    end

    # FIXME: turn back on rubocop ASAP
    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    desc 'release', 'Run the release of the current directory project'
    def release
      @git = Kraken::Git::Service.new
      org, repo = @git.org_and_repo

      project = Kraken::GitHub::Project.new(organization: org, repository: repo)

      yes? "Would you like to release #{project}?"

      release_card = ask 'What is the Trello release card number?'

      release_notes = []
      release_notes << ask('What was in this release?')
      release_notes << ask('What else was in this release?') while yes?('Anything else?')

      release = Kraken::GitHub::Release.new(project: project,
                                            release_card: release_card,
                                            release_notes: release_notes.join("\n"))

      say release.confirmation_message

      yes? 'Does this look good?'

      @github = Kraken::GitHub::Service.new
      github_release_url = @github.perform_release(release)

      say "\nAsk Product to publish the release at:\n\n  #{github_release_url}\n\nThanks!"
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength

    desc 'changelog', 'Run commands related to CHANGELOG.md'
    subcommand 'changelog', Kraken::Changelog::Commands

    desc 'github', 'Run commands related to GitHub'
    subcommand 'github', Kraken::GitHub::Commands

    desc 'git', 'Run commands related to git'
    subcommand 'git', Kraken::Git::Commands

    desc 'kubernetes', 'Run commands related to Kubernetes'
    subcommand 'kubernetes', Kraken::Kubernetes::Commands

    desc 'trello', 'Run commands related to Trello'
    subcommand 'trello', Kraken::Trello::Commands
  end
end
