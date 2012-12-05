# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-instagram/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mihai Anca"]
  gem.email         = ["mihai@mihaia.com"]
  gem.description   = %q{OmniAuth strategy for Instagram.}
  gem.summary       = %q{OmniAuth strategy for Instagram.}
  gem.homepage      = "https://github.com/ropiku/omniauth-instagram"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-instagram"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Instagram::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.12'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
