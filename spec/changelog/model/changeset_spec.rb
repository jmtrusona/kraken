# frozen_string_literal: true

require 'changelog/commands'

RSpec.describe Kraken::Changelog::Changeset do
  context '#to_md' do
    let(:changeset) do
      Kraken::Changelog::Changeset.new(
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
    end

    it 'renders a markdown version of the changeset' do
      expect(changeset.to_md).to eq(fixture_changeset)
    end
  end

  def fixture_changeset
    File.read("#{RSPEC_ROOT}/fixture/files/changeset_to_md.md")
  end
end
