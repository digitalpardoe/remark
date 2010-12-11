namespace :spec do  
  namespace :rcov do
    desc "Run all specs with rcov (ignoring spec folder)"
    RSpec::Core::RakeTask.new(:improved) do |t|
      t.rcov = true
      t.pattern = "./spec/**/*_spec.rb"
      t.rcov_opts = '--exclude spec,/gems/,/Library/,/usr/,lib/tasks,.bundle,config,/lib/rspec/,/lib/rspec-'
    end
  end
end
