# frozen_string_literal: true

require 'changelog/commands'

RSpec.describe Kraken::Changelog::Release do
  context '#to_md' do
    let(:release) { Kraken::Changelog::Release.new(version: '1.0.0', release_date: 'October 10, 2010') }

    it 'renders a markdown version of the release' do
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
      expect(release.to_md).to eq(fixture_release)
    end
  end

  def fixture_release
    File.read("#{RSPEC_ROOT}/fixture/files/release_to_md.md")
  end
end
