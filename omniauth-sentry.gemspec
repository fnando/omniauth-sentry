require "./lib/omniauth-sentry/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-sentry"
  spec.version       = Omniauth::Sentry::VERSION
  spec.authors       = ["Nando Vieira"]
  spec.email         = ["fnando.vieira@gmail.com"]
  spec.summary       = "OmniAuth strategy for Sentry (https://sentry.io)."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/fnando/omniauth-sentry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth-oauth2"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-utils"
  spec.add_development_dependency "pry-meta"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "simplecov"
end
