# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'project-euler/version'

Gem::Specification.new do |spec|
  spec.name          = "project-euler"
  spec.version       = Euler::VERSION
  spec.authors       = ["Sankaranarayanan Viswanathan"]
  spec.email         = ["rationalrevolt@gmail.com"]
  spec.summary       = %q{My solutions to Project Euler problems}
  spec.description   = %q{N/A}
  spec.homepage      = "https://github.com/rationalrevolt/project-euler"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
