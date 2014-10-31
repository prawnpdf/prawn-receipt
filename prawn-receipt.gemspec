# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prawn/receipt/version'

Gem::Specification.new do |spec|
  spec.name          = "prawn-receipt"
  spec.version       = Prawn::Receipt::VERSION
  spec.authors       = ["David Ruan", "Gregory Brown"]
  spec.email         = ["ruanwz@gmail.com", "gregory.t.brown@gmail.com"]
  spec.summary       = "Prawn Receipt"
  spec.description   = "pdf generator for receipt"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "prawn", ">= 1.3.0", "< 3.0.0"
  spec.add_dependency "prawn-table", "~> 0.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", ">= 0.0"
  spec.add_development_dependency "minitest", ">= 0.0"
end
