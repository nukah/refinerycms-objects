# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-objects'
  s.authors           = 'mighty'
  s.version           = '1.5'
  s.description       = 'Ruby on Rails Objects extension for Refinery CMS'
  s.date              = '2013-01-28'
  s.summary           = 'Objects extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.1.0'
  s.add_dependency             'delayed_job_active_record'
  s.add_dependency             'daemons'
  s.add_dependency             'nokogiri'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.0'
end
