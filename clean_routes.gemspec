# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clean_routes/version'

Gem::Specification.new do |gem|
  gem.name          = "clean_routes"
  gem.version       = CleanRoutes::VERSION
  gem.authors       = ["Kyrie"]
  gem.email         = ["kyrie.ak@gmail.com"]
  gem.description   = %q{This module includes a method to print out a clean version of rake routes from the command line}
  gem.summary       = %q{You just have to include this module in a rake task, I think. Lemme know if it doesn't work.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
