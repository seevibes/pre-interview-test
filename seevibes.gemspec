# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seevibes'

Gem::Specification.new do |spec|
  spec.name          = "seevibes"
  spec.version       = "1.0.0"
  spec.authors       = ["Clemence Lelong"]
  spec.email         = ["lelongclemence@gmail.com"]
  spec.summary       = "Search Imdb"
  spec.description   = "Search for a movie on Imdb by partial name"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "thor", '~> 0' #command line interface
  spec.add_dependency "imdb", '~> 0' #api imdb
end
