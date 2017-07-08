# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recycle/version'

Gem::Specification.new do |spec|
  spec.name          = 'recycle'
  spec.version       = Recycle::VERSION
  spec.authors       = ['Jeremy W. Rowe']
  spec.email         = ['jeremywrowe@users.noreply.github.com']

  spec.summary       = 'WIP'
  spec.description   = 'WIP'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'commander', '~> 4.4.3'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'guard-cucumber'
  spec.add_development_dependency 'cucumber', '~> 2.4'
  spec.add_development_dependency 'byebug'
end
