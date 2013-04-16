# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prawntocat/version'

Gem::Specification.new do |spec|
  spec.name          = "prawntocat"
  spec.version       = Prawntocat::VERSION
  spec.authors       = ["Steven! Ragnarök"]
  spec.email         = ["steven@nuclearsandwich.com"]
  spec.description   = %q{Print out your GitHub Issues!}
  spec.summary       = %q{Print out your GitHub Issues!}
  spec.homepage      = "http://nuclearsandwich.com/prawntocat"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "octokit"
  spec.add_dependency "prawn"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
