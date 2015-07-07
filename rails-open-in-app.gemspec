# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_in_app/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-open-in-app"
  spec.version       = OpenInApp::VERSION
  spec.authors       = ["Calvin Yu"]
  spec.email         = ["calvin@scoutmob.com"]
  spec.summary       = %q{Adds support to redirect specific URLs to their mobile app equivalents}
  spec.description   = %q{Rails plugin that add supports to redirect specific URLs to their mobile app equivalents.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency "rails", "~> 4.1.9"
  spec.add_dependency "rack-mobile-detect", "~> 0.4.0"
end
