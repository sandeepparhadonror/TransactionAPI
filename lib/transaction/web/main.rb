module Transaction
  module Web
    class Main < Sinatra::Base


      configure do
        configure :development do
          set :database, 'sqlite3:db/db/development.sqlite3'
        end

        configure :production do
        db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

        ActiveRecord::Base.establish_connection(
          :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
          :host     => db.host,
          :username => db.user,
          :password => db.password,
          :database => db.path[1..-1],
          :encoding => 'utf8'
        )
        end

      end

      set :bind, '0.0.0.0'
      

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
