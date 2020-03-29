# frozen_string_literal: true

require 'changelog/service'

RSpec.describe Kraken::Changelog::Service do
  let(:changelog_file) { double }

  subject { Kraken::Changelog::Service.new }

  it 'parses the CHANGELOG.md' do
    expect(File).to receive(:open).with('CHANGELOG.md').and_return(changelog_file)
    expect(changelog_file).to receive(:read).and_return(generate_changelog)

    result = subject.parse

    expect(result).to be
  end

  private

  def generate_changelog
    %(
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - October 10, 2010

### Added
- New feature
    )
  end
end
