module Transaction
  module Web
    class Main < Sinatra::Base

      configure do
        configure :development do
          set :database, 'sqlite3:db/db/development.sqlite3'
          #set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'your_database_name', pool: 2, username: 'your_username', password: 'your_password'}
        end

        configure :production do
          set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'your_database_name', pool: 2, username: 'your_username', password: 'your_password'}
        end
      end

      before do
        content_type 'application/json'
      end

      after do
        ActiveRecord::Base.connection.close
      end

      helpers do
        def json_params
          begin
            JSON.parse(request.body.read)
          rescue 
          halt 400, {message: "Invalid JSON"}.to_json
           end
        end
      end  


    end
  end
end
