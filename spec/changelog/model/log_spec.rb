# frozen_string_literal: true

require 'changelog/commands'

RSpec.describe Kraken::Changelog::Log do
  context '#to_md' do
    let(:log) { Kraken::Changelog::Log.new(organization: 'jmtrusona', repository: 'kraken') }

    it 'renders a markdown version of the release' do
      log.releases << Kraken::Changelog::Release.new(
        version: 'Unreleased',
        release_date: nil,
        changeset: Kraken::Changelog::Changeset.new(
          changes: [
            Kraken::Changelog::Change.new(
              type: 'Fixed',
              description: 'Emergency bug fix!'
            )
          ]
        )
      )

      log.releases << Kraken::Changelog::Release.new(
        version: '1.1.0',
        release_date: 'October 11, 2011',
        changeset: Kraken::Changelog::Changeset.new(
          changes: [
            Kraken::Changelog::Change.new(
              type: 'Removed',
              description: 'Got rid of something'
            )
          ]
        )
      )

      log.releases << Kraken::Changelog::Release.new(
        version: '1.0.0',
        release_date: 'October 10, 2010',
        changeset: Kraken::Changelog::Changeset.new(
          changes: [
            Kraken::Changelog::Change.new(
              type: 'Added',
              description: 'Created new feature'
            ),
            Kraken::Changelog::Change.new(
              type: 'Added',
              description: 'Added that other thing'
            ),
            Kraken::Changelog::Change.new(
              type: 'Fixed',
              description: 'Squashed dat bug'
            )
          ]
        )
      )

      expect(log.to_md).to eq(fixture_log)
    end
  end

  def fixture_log
    File.read("#{RSPEC_ROOT}/fixture/files/log_to_md.md")
  end
end
