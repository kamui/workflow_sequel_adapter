# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'workflow_sequel_adapter/version'

Gem::Specification.new do |gem|
  gem.name          = "workflow_sequel_adapter"
  gem.version       = WorkflowSequelAdapter::VERSION
  gem.authors       = ["Jack Chu"]
  gem.email         = ["kamuigt@gmail.com"]
  gem.description   = %q{workflow_sequel_adapter is a persistence adapter for the Workflow gem. All you do is include this adapter, and `Workflow` will use the `workflow_column` to retrieve and persist the workflow state.}
  gem.summary       = %q{workflow_sequel_adapter is a persistence adapter for the Workflow gem.}
  gem.homepage      = "http://github.com/kamui/workflow_sequel_adapter"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "workflow"
  gem.add_dependency "sequel"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest"

  if RUBY_PLATFORM == "java"
    gem.add_development_dependency "jdbc-sqlite3"
  else
    gem.add_development_dependency "sqlite3-ruby"
  end
end
