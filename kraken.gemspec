require_relative 'lib/kraken/version'

Gem::Specification.new do |spec|
  spec.name          = 'kraken'
  spec.version       = Kraken::VERSION
  spec.authors       = ['John Mulhern']
  spec.email         = ['jmtrusona@users.noreply.github.com']

  spec.summary       = %q{Tool for performing releases}
  spec.homepage      = 'https://github.com/lighthauz/kraken'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://trusona.jfrog.io/trusona/api/gems/trusona-rubygems'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Runtime Dependencies
  spec.add_dependency 'thor', '~> 0.18'
  spec.add_dependency 'thor-hollaback', '~> 0.2'
  spec.add_dependency 'k8s-client', '~> 0.10'
  spec.add_dependency 'octokit', '~> 4.0'
  spec.add_dependency 'ruby-trello', '~> 2.2'
  spec.add_dependency 'git', '~> 1.6'

  # Task and testing tools
  spec.add_development_dependency 'bundler-audit', '~> 0.6'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.81'

end
