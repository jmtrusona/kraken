# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.16.0] - April 11, 2020

### Added
- Added the initial logic for generating markdown changelog

## [0.15.0] - April 11, 2020

### Added
- Bullet tracer functionality for performing GitHub release
- `kraken release` command

### Changed
- Updated the `kraken changelog view` output to break up changes by type

## [0.14.0] - April 4, 2020

### Added
- Rake task `rake gem:publish` for publishing the gem to Artifactory

## [0.13.0] - April 4, 2020

### Added
- Ability to create a release from the GitHub service
- `kraken github release` command

### Changed
- Moved the `kraken github tags` to `kraken git tags`

## [0.12.0] - April 4, 2020

### Added
- Lists the changes for each release in the output of `kraken changelog view` command

## [0.11.0] - March 31, 2020

### Changed
- Updates to `kraken changelog view` command to parse changes

## [0.10.0] - March 29, 2020

### Changed
- Update to kraken_spec to ensure subcommands are being listed

### Fixed
- Unskipped tests related to the changelog view functionality (still under construction)
- Fixed this changelog links

## [0.9.0] - March 29, 2020

### Added
- `kraken changelog view` command but sill under construction

### Changed
- Refactored Wrappers to use named parameter
- Renamed `Kraken::Git::Service` to `Kraken::Git::Wrapper`
- Naming clean up in specs
 
### Removed
- Cleaned up unused error classes

## [0.8.0] - March 28, 2020

### Changed
- Switch to use named parameters on model
- Refactored the git service
- Moved commands down to subcommands based off type:
  - `kraken git whoami`
  - `kraken github tags`
  - `kraken kubernetes pods [LABEL]`
  - `kraken trello cards`

## [0.7.0] - March 25, 2020

### Added
- Git service for retrieving the current directory git remote url
- `kraken whoami` command

### Changed
- Fixed broken rspec tests

### Removed
- Cleaned up the faker classes which were not useful

## [0.6.0] - March 22, 2020

### Added
- Model for Trello cards, GitHub tags and Kubernetes pods

### Changed
- Cleaned up the module approach for all client wrappers

## [0.5.0] - March 22, 2020

### Added
- Trello client for looking up Trello cards
- `kraken cards` command

## [0.4.0] - March 22, 2020

### Added
- GitHub client for looking up git tags
- `kraken tags` command

## [0.3.0] - March 22, 2020

### Changed
- Kubernetes client to take a ClientWrapper approach
- kraken_spec.rb tests mock out kubernetes calls

## [0.2.0] - March 21, 2020

### Added
- `kraken hello` command
- Setup rspec test suite
- Added rubocop to default rake task
- `kraken pods` command for listing pods by the `app` label in kubernetes

## [0.1.0] - March 21, 2020

### Added
- Initial project creation
- Added rubocop

[Unreleased]: https://github.com/jmtrusona/kraken/compare/v0.14.0...HEAD
[0.14.0]: https://github.com/jmtrusona/kraken/compare/v0.13.0...v0.14.0
[0.13.0]: https://github.com/jmtrusona/kraken/compare/v0.12.0...v0.13.0
[0.12.0]: https://github.com/jmtrusona/kraken/compare/v0.11.0...v0.12.0
[0.11.0]: https://github.com/jmtrusona/kraken/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/jmtrusona/kraken/compare/v0.9.0...v0.10.0
[0.9.0]: https://github.com/jmtrusona/kraken/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/jmtrusona/kraken/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/jmtrusona/kraken/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/jmtrusona/kraken/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/jmtrusona/kraken/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/jmtrusona/kraken/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/jmtrusona/kraken/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/jmtrusona/kraken/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/jmtrusona/kraken/releases/tag/v0.1.0