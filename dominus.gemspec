# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dominus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Håkon Lerring"]
  gem.email         = ["hakon@powow.no"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{Adds an easy to use wrapper around the domino diiop database api.\n Memory management (recycling the domino objects) is handled by ruby.}
  gem.homepage      = "http://github.com/Hakon/dominus"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dominus"
  gem.require_paths = ["lib", "jars"]
  gem.version       = Dominus::VERSION
end
