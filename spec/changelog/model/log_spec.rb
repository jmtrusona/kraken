# frozen_string_literal: true

require 'changelog/commands'

RSpec.describe Kraken::Changelog::Log do
  context '#to_md' do
    let(:log) { Kraken::Changelog::Log.new }

    it 'renders a markdown version of the release' do
      release = Kraken::Changelog::Release.new(version: '1.0.0', release_date: 'October 10, 2010')
      release.changeset = Kraken::Changelog::Changeset.new(
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
      log.releases << release

      expect(log.to_md).to eq(fixture_log)
    end
  end

  def fixture_log
    File.read("#{RSPEC_ROOT}/fixture/files/log_to_md.md")
  end
end
