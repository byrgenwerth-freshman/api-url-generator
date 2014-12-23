# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_url_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "api_url_generator"
  spec.version       = APIURLGenerator::VERSION
  spec.authors       = ["M. A. Owens"]
  spec.email         = ["matt@cremalab.com"]
  spec.summary       = %q{
      After writing a few RESTful APIs with Rails, I was always running into issues with generating URL for my resources.
      Either, I would try to force `url_for` or `path_to` to work, but it was never ideal.
      Since, I couldn't find any other solutions, I decide to write my own.
      This gem helps create urls for your RESTful API to make it easier for client applications to navigate without using `ActionView::Helpers`
  }
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
