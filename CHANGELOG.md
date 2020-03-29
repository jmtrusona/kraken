# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

### Updated
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

### Updated
- Fixed broken rspec tests

### Deleted
- Cleaned up the faker classes which were not useful

## [0.6.0] - March 22, 2020

### Added
- Model for Trello cards, GitHub tags and Kubernetes pods

### Updated
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

### Updated
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

[Unreleased]: https://github.com/jmtrusona/kraken/compare/v0.7.0...HEAD
[0.7.0]: https://github.com/jmtrusona/kraken/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/jmtrusona/kraken/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/jmtrusona/kraken/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/jmtrusona/kraken/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/jmtrusona/kraken/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/jmtrusona/kraken/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/jmtrusona/kraken/releases/tag/v0.1.0