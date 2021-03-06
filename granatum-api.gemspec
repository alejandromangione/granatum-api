# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "granatum-api"
  spec.version       = "1.0.0"
  spec.authors       = ["Alejandro Mangione"]
  spec.email         = ["alejandro.mangione@gmail.com"]
  spec.summary       = %q{ruby client for Granatum API.}
  spec.description   = %q{ruby client for Granatum API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('httparty', '~> 0.13.3')

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency "rake"
end
