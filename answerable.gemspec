require_relative "lib/answerable/version"

Gem::Specification.new do |spec|
  spec.name        = "answerable"
  spec.version     = Answerable::VERSION
  spec.authors     = ["Andrea Ranaldi"]
  spec.email       = ["andrea.ranaldi@gmail.com"]
  spec.homepage    = "https://github.com/isprambiente/answerable"
  spec.summary     = "Summary of Answerable."
  spec.description = "Answerable centralize question and answer for any model"
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/isprambiente/answerable"
  spec.metadata["changelog_uri"] = "https://github.com/isprambiente/answerable/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3"
end
