# frozen_string_literal: true

require 'changelog/service'

RSpec.describe Kraken::Changelog::Service do
  let(:changelog_file) { double }
  let(:project) { double }

  subject { Kraken::Changelog::Service.new }

  it 'parses the CHANGELOG.md' do
    expect(File).to receive(:open).with('CHANGELOG.md').and_return(changelog_file)
    expect(changelog_file).to receive(:readlines).and_return(fixture_changelog)

    log = subject.parse

    releases = log.releases
    expect(releases.size).to eq(3)

    unreleased = releases[0]
    expect(unreleased.version).to eq('Unreleased')
    expect(unreleased.release_date).to be_nil
    expect(unreleased.changeset.changes[0]).to have_attributes(type: 'Removed',
                                                               description: 'Cleaned up extra stuff')
    v020 = releases[1]
    expect(v020.version).to eq('0.2.0')
    expect(v020.release_date).to eq('October 11, 2010')
    expect(v020.changeset.changes[0]).to have_attributes(type: 'Added',
                                                         description: 'Other new feature')
    expect(v020.changeset.changes[1]).to have_attributes(type: 'Changed',
                                                         description: 'Updated the last feature to do something cooler')
    expect(v020.changeset.changes[2]).to have_attributes(type: 'Fixed',
                                                         description: 'Fixed that other bug')

    v010 = releases[2]
    expect(v010.version).to eq('0.1.0')
    expect(v010.release_date).to eq('October 10, 2010')
    expect(v010.changeset.changes[0]).to have_attributes(type: 'Added',
                                                         description: 'New feature')
    expect(v010.changeset.changes[1]).to have_attributes(type: 'Removed',
                                                         description: 'Deleted the last thing it did')
    expect(v010.changeset.changes[2]).to have_attributes(type: 'Fixed',
                                                         description: 'Fixed that bug:' \
                                                                      ' - Addressed issue with other stuff' \
                                                                      ' - Fixed this other thing')
  end

  private

  def fixture_changelog
    File.read("#{RSPEC_ROOT}/fixture/files/CHANGELOG.md").split("\n")
  end
end
