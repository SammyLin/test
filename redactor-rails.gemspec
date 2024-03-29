# -*- encoding: utf-8 -*-
require File.expand_path('../lib/redactor-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sammy"]
  gem.email         = ["sammylintw@gmail.com"]
  gem.description   = "The redactor-rails gem integrates the Redactor editor"
  gem.summary       = ""
  gem.homepage      = "https://github.com/SammyLin/redactor-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "redactor-rails"
  gem.require_paths = ["lib"]
  gem.version       = RedactorRails::VERSION
end
