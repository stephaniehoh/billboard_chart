# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "billboard_chart"
  spec.version       = "1.0.2"
  spec.executables   << "billboard_chart"
  spec.authors       = ["Stephanie Oh"]
  spec.email         = ["stephoh@gmail.com"]
  spec.description   = "Brings the Top 10 Billboard Hot 100 Singles Chart to your terminal"
  spec.summary       = "Use the Billboard gem to check out which singles are dominating pop music today"
  spec.homepage      = "https://github.com/stephaniehoh/billboard_chart"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.8.7"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "colored"
end
