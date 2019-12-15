lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitlab_roulette/version"

Gem::Specification.new do |spec|
  spec.name          = "gitlab_roulette"
  spec.version       = GitlabRoulette::VERSION
  spec.authors       = ["Andrei Merfu"]
  spec.email         = ["andreimerfu@outlook.com"]

  spec.summary       = %q{GitlabRoulette adds a reviewer roulette to your self hosted Gitlab repository}
  spec.description   = %q{GitlabRoulette choose reviewer and a maintainer for your merge request automatically}
  spec.homepage      = "https://github.com/andreimerfu/gitlab_roulette.git"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/andreimerfu/gitlab_roulette.git"
  spec.metadata["changelog_uri"] = "https://github.com/andreimerfu/gitlab_roulette.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "danger-gitlab", "~> 7.0.0"
  spec.add_development_dependency "danger", "~> 6.1.0"
  spec.add_development_dependency "faraday", "~> 0.17.1"
end
