namespace :remark do
  namespace :setup do
    desc "Sets up the database configuration for the specified adapter"
    task :db, :adapter do |t, args|
      case args[:adapter]
        when "sqlite3" 
          config = "sqlite: &sqlite\n" \
          << "  adapter: sqlite3\n" \
          << "  pool: 5\n" \
          << "  timeout: 5000\n" \
          << "\n" \
          << "development:\n" \
          << "  <<: *sqlite\n" \
          << "  database: db/development.sqlite3\n" \
          << "\n" \
          << "test:\n" \
          << "  <<: *sqlite\n" \
          << "  database: db/test.sqlite3\n" \
          << "\n" \
          << "production:\n" \
          << "  <<: *sqlite\n" \
          << "  database: db/production.sqlite3\n"
          write_config_file(config)
        when "mysql"
          db_host = request_input("\nDatabase host: ")
          db_username = request_input("\nUsername: ")
          db_password = request_input("\nPassword: ")
          db_development = request_input("\nDevelopment database name: ")
          db_test = request_input("\nTest database name: ")
          db_production = request_input("\nProduction database name: ")
          
          config = "mysql: &mysql\n" \
          << "  adapter: mysql\n" \
          << "  host: #{db_host}\n" \
          << "  username: #{db_username}\n" \
          << "  password: #{db_password}\n" \
          << "\n" \
          << "development:\n" \
          << "  <<: *mysql\n" \
          << "  database: #{db_development}\n" \
          << "\n" \
          << "test:\n" \
          << "  <<: *mysql\n" \
          << "  database: #{db_test}\n" \
          << "\n" \
          << "production:\n" \
          << "  <<: *mysql\n" \
          << "  database: #{db_production}\n"
          write_config_file(config)
        else
          puts "\n" \
          << "I'm afraid I don't know anything about the '#{args[:adapter]}'\n" \
          << "adapter, you'll have to set up 'config/database.yml'\n and" \
          << "run the migrations manually.\n\n"
      end
    end
  end
end

private
def request_input(message)
  puts message
  STDIN.gets.chomp
end

def write_config_file(contents)
  File.open(File.join(Rails.root, "config", "database.yml"), 'w') { |f| f.write(contents) }
end
