# -*- encoding: utf-8 -*-

require File.expand_path('../lib/omniauth-instagram/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Mihai Anca']
  gem.email         = ['mihai@mihaia.com']
  gem.description   = 'OmniAuth strategy for Instagram.'
  gem.summary       = 'OmniAuth strategy for Instagram.'
  gem.homepage      = 'https://github.com/ropiku/omniauth-instagram'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-instagram'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Instagram::VERSION

  gem.add_dependency 'omniauth', '~> 1'
  gem.add_dependency 'omniauth-oauth2', '~> 1'

  # s.add_development_dependency 'dotenv', '>= 2.0'
  # s.add_development_dependency 'sinatra', '>= 2.0'
end
