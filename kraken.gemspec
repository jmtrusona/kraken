require_relative 'lib/kraken/version'

Gem::Specification.new do |spec|
  spec.name          = "kraken"
  spec.version       = Kraken::VERSION
  spec.authors       = ["John Mulhern"]
  spec.email         = ['jmtrusona@users.noreply.github.com']

  spec.summary       = %q{Tool for performing releases}
  spec.homepage      = 'https://github.com/jmtrusona/kraken'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata['allowed_push_host'] = 'https://trusona.jfrog.io/trusona/api/gems/trusona-rubygems'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/jmtrusona/kraken'
  spec.metadata["changelog_uri"] = "https://github.com/jmtrusona/kraken/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "thor", "~> 0.20"
end
