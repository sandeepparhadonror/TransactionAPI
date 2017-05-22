module Transaction
  module Web
    class Consumers < Main

    
      get '/' do
        Consumer.all.to_json
      end

      get '/show/:id' do |id|
      	consumer = Consumer.where(id: Integer(id)).first
      	halt(400, {message: "Consumer Not Found"}.to_json) unless consumer
      	status 200
      	consumer.to_json
      end	

      post '/create' do
      	consumer = Consumer.new(json_params)
      	if consumer.save!
      	  status 201
      	  consumer.to_json
      	else
      		status 400
      		consumer.errors.to_json
      	end		
      end	

      put '/update/:id' do |id|
      	consumer = Consumer.where(id: Integer(id)).first
      	halt(404, {message:"Consumer Not Found"}.to_json) unless consumer
      	if consumer.update_attributes(json_params)
      		consumer.to_json
      	else
      		status 422
      		consumer.errors.to_json
      	end	
      end

    end
  end
end


#curl http://transactiondetailsapi.herokuapp.com/consumers
#curl http://transactiondetailsapi.herokuapp.com/consumers/show/5
#curl -i -X POST -H "Content-Type: application/json" -d '{"first_name":"Jack", "last_name":"Parow"}' http://transactiondetailsapi.herokuapp.com/consumers/create  
#curl -i -X PUT -H "Content-Type: application/json" -d '{"first_name":"Jack", "last_name":"saasa"}' http://transactiondetailsapi.herokuapp.com/consumers/update/4



