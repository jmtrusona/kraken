# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- Nothing

## [0.3.0] - March 22, 2020

### Updated
- Kubernetes client to take a ClientWrapper approach
- kraken_spec.rb tests mock out kubernetes calls

## [0.2.0] - March 21, 2020

### Added
- `hello` command
- Setup rspec test suite
- Added rubocop to default rake task
- `pod` command for listing pods by the `app` label in kubernetes

## [0.1.0] - March 21, 2020

### Added
- Initial project creation
- Added rubocop

[Unreleased]: https://github.com/jmtrusona/kraken/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/jmtrusona/kraken/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/jmtrusona/kraken/releases/tag/v0.1.0