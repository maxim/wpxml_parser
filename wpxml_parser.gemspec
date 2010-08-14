Gem::Specification.new do |s|
  s.name        = "wpxml_parser"
  s.version     = "0.0.1"
  s.author      = "Maxim Chernyak"
  s.email       = "max@bitsonnet.com"
  s.homepage    = "http://github.com/maxim/wpxml_parser"
  s.summary     = "Convenient WordPress XML dump parser."
  s.description = "Convenient parser that provides a clean way to interact with wordpress's XML dump file in your ruby scripts, to make it easy to migrate away from WordPress anywhere else."

  s.files        = Dir["{lib}/**/*", "[A-Z]*"]
  s.require_path = "lib"

  s.add_dependency 'nokogiri'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end