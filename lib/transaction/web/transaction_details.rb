module Transaction
  module Web
    class TransactionDetails < Main

  		get '/' do
  			"Called the TransactionDetails"
  			TransactionDetail.all.to_json
  		end

  		get '/show/:id' do |id|
  			transactiondetail = TransactionDetail.where(id: Integer(id)).first
  			halt(400, {message: "Transaction Not Found"}.to_json) unless transactiondetail
  			status 200
  			transactiondetail.to_json
  		end

  		post '/create' do
  			transactiondetail = TransactionDetail.new(json_params)
  			if transactiondetail.save!
  				status 200
  				transactiondetail.to_json
  			else
  				status 422
  				transactiondetail.errors.to_json
  			end	
  		end

  		put '/update/:id' do |id|
      	transactiondetail = TransactionDetail.where(id: Integer(id)).first
      	halt(404, {message:"TransactionDetail Not Found"}.to_json) unless transactiondetail
      	if transactiondetail.update_attributes(json_params)
      		transactiondetail.to_json
      	else
      		status 422
      		transactiondetail.errors.to_json
      	end	
      end
 	


    end
  end
end


#curl http://transactiondetailsapi.herokuapp.com/transactiondetails
#curl http://transactiondetailsapi.herokuapp.com/transactiondetails/show/1
#curl -i -X POST -H "Content-Type: application/json" -d '{"sale_amount":"100", "consumer_id":"1", "merchant_id":"2"}' http://transactiondetailsapi.herokuapp.com/transactiondetails/create  
#curl -i -X PUT -H "Content-Type: application/json" -d '{"sale_amount":"500", "consumer_id":"2", "merchant_id":"2"}' http://transactiondetailsapi.herokuapp.com/transactiondetails/update/4
