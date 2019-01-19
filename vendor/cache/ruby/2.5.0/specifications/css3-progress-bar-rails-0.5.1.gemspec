# -*- encoding: utf-8 -*-
# stub: css3-progress-bar-rails 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "css3-progress-bar-rails".freeze
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nicholas Fine".freeze, "Josh Sullivan".freeze]
  s.date = "2017-03-14"
  s.description = "Integrates Josh Sullivan's CSS3 Progress Bars into Rails and adds ActionView helpers for generation.".freeze
  s.email = ["nicholas.fine@gmail.com".freeze, "josh@dipperstove.com".freeze]
  s.homepage = "https://github.com/yrgoldteeth/css3-progress-bar-rails".freeze
  s.rubyforge_project = "css3-progress-bar-rails".freeze
  s.rubygems_version = "2.7.8".freeze
  s.summary = "Integrates Josh Sullivan's CSS3 Progress Bars into Rails 3.1+ Projects.".freeze

  s.installed_by_version = "2.7.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.1"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 3.1"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.1"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
  end
end
