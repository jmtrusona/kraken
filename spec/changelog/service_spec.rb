# frozen_string_literal: true

require 'changelog/service'

RSpec.describe Kraken::Changelog::Service do
  let(:changelog_file) { double }

  subject { Kraken::Changelog::Service.new }

  it 'parses the CHANGELOG.md' do
    expect(File).to receive(:open).with('CHANGELOG.md').and_return(changelog_file)
    expect(changelog_file).to receive(:readlines).and_return(generate_changelog)

    releases = subject.parse

    expect(releases.size).to eq(2)

    expect(releases.first.version).to eq('0.2.0')
    expect(releases.first.release_date).to eq('October 11, 2010')
    expect(releases.first.changeset.changes).to eq([
                                                     'Other new feature',
                                                     'Updated the last feature to do something cooler',
                                                     'Fixed that other bug'
                                                   ])

    expect(releases.last.version).to eq('0.1.0')
    expect(releases.last.release_date).to eq('October 10, 2010')
    expect(releases.last.changeset.changes).to eq([
                                                    'New feature',
                                                    'Deleted the last thing it did',
                                                    'Fixed that bug:' \
                                                    ' - Addressed issue with other stuff' \
                                                    ' - Fixed this other thing'
                                                  ])
  end

  private

  def generate_changelog
    %(
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - October 11, 2010

### Added
- Other new feature

### Changed
- Updated the last feature to do something cooler

### Fixed
- Fixed that other bug

## [0.1.0] - October 10, 2010

### Added
- New feature

### Removed
- Deleted the last thing it did

### Fixed
- Fixed that bug:
  - Addressed issue with other stuff
  - Fixed this other thing

[0.2.0]: https://github.com/jmtrusona/kraken/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/jmtrusona/kraken/releases/tag/v0.1.0
    ).split("\n")
  end
end
