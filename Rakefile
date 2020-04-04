require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'net/http'
require 'uri'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

task default: [:spec, :rubocop]

namespace :artifactory do
  desc 'fetch the gem credentials file from artifactory'
  task :credentials do
    artifactory_username = ENV['ARTIFACTORY_USERNAME'].sub('%40', '@')
    artifactory_password = ENV['ARTIFACTORY_PASSWORD']

    uri = URI.parse('https://trusona.jfrog.io/trusona/api/gems/trusona-rubygems/api/v1/api_key.yaml')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth artifactory_username, artifactory_password
    resp = http.request(req)

    gem_credentials_filepath = File.join(Dir.home, '.gem', 'credentials')
    File.write(gem_credentials_filepath, resp.body)
    File.chmod(0o0600, gem_credentials_filepath)
  end
end


namespace :gem do

  desc 'publish the gem'
  task publish: %i[build push] do; end

  desc 'build the gem'
  task :build do
    sh 'gem build kraken.gemspec -o tmp/kraken.gem'
  end

  desc 'push the gem to artifactory'
  task push: %i[artifactory:credentials] do
    sh 'gem push tmp/kraken.gem  --host https://trusona.jfrog.io/trusona/api/gems/trusona-rubygems'
  end
end