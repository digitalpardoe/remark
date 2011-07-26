namespace :remark do
  desc "Automagically modify the application to make it happy on Heroku"
  task :herokuify do
    # Rewrite the Gemfile
    contents = ""
    File.open(File.join(Rails.root, 'Gemfile'), 'r').each do |line|
      if /.* #heroku/ =~ line
        contents << line[1,line.length]
      elsif /.* #no-heroku/ =~ line
        contents << "#" + line
      else
        contents << line
      end
    end
    
    File.open(File.join(Rails.root, 'Gemfile'), 'w') { |f| f.write(contents) }
    
    # Create the Procfile
    contents = "web: bundle exec rails server thin -p $PORT"
    File.open(File.join(Rails.root, 'Procfile'), 'w') { |f| f.write(contents) }
  end
  
  desc "Automagically modify the application to remove the Heroku happiness"
  task :unherokuify do
    # Rewrite the Gemfile
    contents = ""
    File.open(File.join(Rails.root, 'Gemfile'), 'r').each do |line|
      if /.* #no-heroku/ =~ line
        contents << line[1,line.length]
      elsif /.* #heroku/ =~ line
        contents << "#" + line
      else
        contents << line
      end
    end
    
    File.open(File.join(Rails.root, 'Gemfile'), 'w') { |f| f.write(contents) }
    
    # Delete the Procfile
    File.delete(File.join(Rails.root, 'Procfile'))
  end
end
