# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fickle/version"

Gem::Specification.new do |s|
  s.name        = "fickle"
  s.version     = Fickle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["chrisrhoden"]
  s.email       = ["chris@lazerclub.co"]
  s.homepage    = ""
  s.summary     = %q{The feature library for rails that can't make up its mind}
  s.description = %q{Fickle lets you turn features on and off at will in your rails app using a web interface.
                     It also lets you manage features on a model-by-model basis (maybe users?)}.gsub('                     ','')

  s.rubyforge_project = "fickle"
  
  s.add_development_dependency 'rspec', '~> 2.4.0'
  s.add_development_dependency 'rails', '~> 3.0.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
