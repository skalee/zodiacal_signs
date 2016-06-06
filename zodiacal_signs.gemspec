# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zodiacal_signs/version'

Gem::Specification.new do |spec|
  spec.name          = "zodiacal_signs"
  spec.version       = ZodiacalSigns::VERSION
  spec.authors       = ["Sebastian Skałacki"]
  spec.email         = ["skalee@gmail.com"]

  spec.summary       = %q{Calculates zodiacal signs for given birth dates.}
  spec.licenses      = %w[Ruby MIT ISC]
  spec.homepage      = "https://github.com/skalee/zodiacal_signs"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", ">= 5.0"
  spec.add_development_dependency "activesupport"
end
