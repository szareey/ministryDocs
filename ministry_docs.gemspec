# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ministry_docs/version'

Gem::Specification.new do |spec|
  spec.name          = 'ministry_docs'
  spec.version       = MinistryDocs::VERSION
  spec.authors       = ['Sergey Popov']
  spec.email         = ['quolpr@gmail.com']

  spec.summary       = 'Ministry docs parser'
  spec.homepage      = "https://github.com/szareey/ministryDocs"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'mechanize'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
