require File.expand_path("../lib/bootstrap_icons/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "bootstrap-icons"
  s.version     = BootstrapIcons::VERSION
  s.summary     = "Bootstrap Icons gem"
  s.platform    = Gem::Platform::RUBY
  s.description = "A package that distributes Bootstrap Icons in a gem"
  s.authors     = ["Marcelo Lauxen"]
  s.email       = ["marcelolauxen16@gmail.com"]
  s.files       = Dir["{lib}/**/*"] + ["LICENSE", "README.md"]
  s.homepage    = "https://github.com/marcelolx/bootstrap-icons"
  s.license     = "MIT"
  s.add_dependency "nokogiri", "~> 1.6"
end
