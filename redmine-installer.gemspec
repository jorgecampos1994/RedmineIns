# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redmine-installer/version'

Gem::Specification.new do |spec|
  spec.name          = 'redmine-installer'
  spec.version       = RedmineInstaller::VERSION
  spec.authors       = ['Ondřej Moravčík']
  spec.email         = ['moravcik.ondrej@gmail.com']
  spec.summary       = %q{Easy way how install/upgrade redmine or plugin.}
  spec.description   = %q{Redmine-installer can fully install/upgrade redmine and will
                       generate template for different server. All actions can be saved
                       for further use.}
  spec.homepage      = 'https://github.com/easyredmine/redmine-installer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_runtime_dependency 'ansi'
  # spec.add_runtime_dependency 'gli'
  # spec.add_runtime_dependency 'i18n'
  # spec.add_runtime_dependency 'notifier'
  # spec.add_runtime_dependency 'ruby-progressbar'
  # spec.add_runtime_dependency 'rubyzip'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
