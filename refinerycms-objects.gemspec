# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-objects'
  s.authors           = 'mighty'
  s.version           = '1.3'
  s.description       = 'Ruby on Rails Objects extension for Refinery CMS'
  s.date              = '2012-06-20'
  s.summary           = 'Objects extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.4'
  s.add_dependency             'delayed_job_active_record'
  s.add_dependency             'daemons'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.4'
end
