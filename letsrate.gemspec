# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "letsrate/version"

Gem::Specification.new do |s|
  s.name        = "letsrate"
  s.version     = Letsrate::VERSION
  s.authors     = ["Murat GUZEL"]
  s.email       = ["guzelmurat@gmail.com"]
  s.homepage    = "http://github.com/muratguzel/letsrate"
  s.summary     = %q{Provides the best solution to add rating functionality to your models.}
  s.description = %q{Provides the best solution to add rating functionality to your models.}

  s.rubyforge_project = "letsrate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # runtime dependencies
  s.add_runtime_dependency("rails", ">= 3.2")

  # development dependencies
  # s.add_development_dependency "rspec"
end
