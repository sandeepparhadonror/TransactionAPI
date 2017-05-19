module Transaction
  module Web
  	class Merchants < Main

  		get '/' do
        Merchant.all.to_json
  		end

  		get '/show/:id' do |id|
  			merchant = Merchant.where(id: Integer(id)).first
  			halt(400, {message: "Merchats Not Found"}.to_json) unless merchant
  			status 20
  			merchant.to_json
  		end	

  		post '/create' do
  			merchant = Merchant.new(json_params)
  			if merchant.save!
  				status 200
  				merchant.to_json
  			else
  				status 422
  				merchant.errors.to_json
  			end	
  		end

  		put '/update/:id' do |id|
      	merchant = Merchant.where(id: Integer(id)).first
      	halt(404, {message:"Merchant Not Found"}.to_json) unless merchant
      	if merchant.update_attributes(json_params)
      		merchant.to_json
      	else
      		status 422
      		merchant.errors.to_json
      	end	
      end
 	

  	end	
  end	
end	



#curl http://localhost:9292/merchants
#curl http://localhost:9292/merchants/show/5
#curl -i -X POST -H "Content-Type: application/json" -d '{"merchant_name":"Sandeep Flower", "domain":"flower"}' http://localhost:9292/merchants/create  
#curl -i -X PUT -H "Content-Type: application/json" -d '{"merchant_name":"Sandeep", "domain":"Flower and Decoretor"}' http://localhost:9292/merchants/update/2

