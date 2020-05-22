require File.expand_path("../lib/bootstrap-icons-helper/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "bootstrap-icons-helper"
  s.version     = BootstrapIconsHelper::VERSION
  s.summary     = "Bootstrap I rails helper"
  s.description = "A rails helper that makes including svg Bootstrap Icons simple."
  s.authors     = ["Marcelo Lauxen"]
  s.email       = ["marcelolauxen16@gmail.com"]
  s.files       = Dir["{lib}/**/*"] + ["LICENSE", "README.md"]
  s.homepage    = "https://github.com/marcelolx/bootstrap-icons"
  s.license     = "MIT"

  s.require_paths = ["lib"]

  s.add_dependency "bootstrap-icons", "0.0.1"
  s.add_dependency "rails", "~> 6.0"
end
