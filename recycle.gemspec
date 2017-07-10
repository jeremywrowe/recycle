# coding: utf-8

require_relative 'lib/recycle/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '~> 2.3'
  spec.name          = 'recycle'
  spec.version       = Recycle::VERSION
  spec.authors       = ['Jeremy W. Rowe']
  spec.email         = ['jeremywrowe@users.noreply.github.com']
  spec.license       = 'MIT'
  spec.summary       = 'Command line tool for optimizing workflows through aliases'
  spec.description   = <<-EOF
    Recycle is a command line interface (CLI) that helps automate workflows by storing
    commands and aliases in a standardized location. Recycle allows you to list, add, and remove
    commands and directories that you frequent.
  EOF
  spec.require_paths = ['lib']
  spec.bindir        = 'exe'
  spec.executables   = ['recycle']
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  # deps
  spec.add_dependency 'commander', '~> 4.4.3'

  # dev deps
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'cucumber', '~> 2.4'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-cucumber'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
