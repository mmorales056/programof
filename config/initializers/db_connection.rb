require "active_record"
class DbConnection
    def connect
        ActiveRecord::Base.establish_connection(config_file) 
    end

    def config_file
        @config_file ||= JSON.load(File.new(file_path))
    end

    def file_path
        File.join(APP_ROOT,'config','database.json')
    end
end
DbConnection.new.connect