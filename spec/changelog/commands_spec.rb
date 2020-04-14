# frozen_string_literal: true

require 'changelog/commands'

RSpec.describe Kraken::Changelog::Commands do
  context '#view' do
    let(:service) { double }

    let(:changelog) do
      Kraken::Changelog::Log.new(
        organization: 'jmulhern',
        repository: 'kraken',
        releases:
          [
            Kraken::Changelog::Release.new(version: '1.2.3',
                                           release_date: 'Feb 4, 2010',
                                           changeset: Kraken::Changelog::Changeset.new(
                                             changes: [
                                               Kraken::Changelog::Change.new(
                                                 type: 'Changed',
                                                 description: 'Updated the thing'
                                               ),
                                               Kraken::Changelog::Change.new(
                                                 type: 'Added',
                                                 description: 'Added the feature'
                                               )
                                             ]
                                           )),

            Kraken::Changelog::Release.new(version: '0.7.1',
                                           release_date: 'Feb 1, 2003',
                                           changeset: Kraken::Changelog::Changeset.new(
                                             changes: [
                                               Kraken::Changelog::Change.new(
                                                 type: 'Fixed',
                                                 description: 'Fixed the other issue'
                                               ),
                                               Kraken::Changelog::Change.new(
                                                 type: 'Removed',
                                                 description: 'Cleaned up the last of it'
                                               )
                                             ]
                                           ))
          ]
      )
    end

    let(:output) { capture(:stdout) { subject.view(service) } }

    it 'parses the CHANGELOG.md and displays the releases and changesets' do
      expect(service).to receive(:parse).and_return(changelog)

      expected  = "Version: 1.2.3\n"
      expected += "Released: Feb 4, 2010\n"
      expected += "Added:\n"
      expected += "- Added the feature\n"
      expected += "Changed:\n"
      expected += "- Updated the thing\n"
      expected += "-----------\n"
      expected += "Version: 0.7.1\n"
      expected += "Released: Feb 1, 2003\n"
      expected += "Fixed:\n"
      expected += "- Fixed the other issue\n"
      expected += "Removed:\n"
      expected += "- Cleaned up the last of it\n"
      expected += "-----------\n"

      expect(output).to eq(expected)
    end
  end
end
