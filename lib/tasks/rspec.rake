begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  Rake.application.instance_variable_get('@tasks')['default'].prerequisites.delete('test')
  spec_prereq = Rails.configuration.generators.options[:rails][:orm] == :active_record ?  "db:test:prepare" : :noop

  namespace :spec do
    namespace :rcov do
      desc "Run all specs with rcov, excluding the spec directory"
      RSpec::Core::RakeTask.new(:improved => spec_prereq) do |t|
        t.rcov = true
        t.pattern = "./spec/**/*_spec.rb"
        t.rcov_opts = '--exclude spec,/gems/,/Library/,/usr/,lib/tasks,.bundle,config,/lib/rspec/,/lib/rspec-'
      end
    end
  end
rescue LoadError
end
