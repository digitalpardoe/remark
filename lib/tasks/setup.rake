namespace :remark do
  namespace :setup do
    desc "Sets up the database configuration for the specified adapter"
    task :db, :adapter do |t, args|
      case args[:adapter]
        when "sqlite3" 
          config = <<-CONF
sqlite: &sqlite
  adapter: sqlite3
  pool: 5
  timeout: 5000
  
development:
  <<: *sqlite
  database: db/development.sqlite3
  
test:
  <<: *sqlite
  database: db/test.sqlite3
  
production:
  <<: *sqlite
  database: db/production.sqlite3
          CONF
          write_config_file(config)
        when "mysql"
          config = <<-CONF
mysql: &mysql
  adapter: mysql
  host: #{request_input("Database host: ")}
  username: #{request_input("Username: ")}
  password: #{request_input("Password: ")}
  
development:
  <<: *mysql
  database: #{request_input("Development database name: ")}

test:
  <<: *mysql
  database: #{request_input("Test database name: ")}
  
production:
  <<: *mysql
  database: #{request_input("Production database name: ")}
          CONF
          write_config_file(config)
        else
          puts <<-MSG
          
I'm afraid I don't know anything about the '#{args[:adapter]}'
adapter, you'll have to set up 'config/database.yml'
manually.
          
          MSG
      end
    end
  end
end

private
def request_input(message)
  puts "\n#{message}"
  STDIN.gets.chomp
end

def write_config_file(contents)
  File.open(File.join(Rails.root, "config", "database.yml"), 'w') { |f| f.write(contents) }
end
