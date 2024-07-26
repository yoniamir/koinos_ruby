# koinos_ruby.gemspec
require_relative 'lib/koinos_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "koinos_ruby"
  spec.version       = KoinosRuby::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]
  spec.summary       = "A client for the Koinos API"
  spec.description   = "A Ruby client for interacting with the Koinos blockchain API."
  spec.homepage      = "https://github.com/yourusername/koinos_ruby"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.0"
end
