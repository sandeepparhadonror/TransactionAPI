# TransactionDetail with Consumer and Merchants

Calling the API 

*  **Consumers.** 

 	`curl http://transactiondetailsapi.herokuapp.com/consumers`

 	`curl http://transactiondetailsapi.herokuapp.com/consumers/show/5`

 	`curl -i -X POST -H "Content-Type: application/json" -d '{"first_name":"Jack", "last_name":"Parow"}' http://transactiondetailsapi.herokuapp.com/consumers/create`

 	`curl -i -X PUT -H "Content-Type: application/json" -d '{"first_name":"Jack", "last_name":"saasa"}' http://transactiondetailsapi.herokuapp.com/consumers/update/4`


*  **Merchants.**

 	`curl http://transactiondetailsapi.herokuapp.com/merchants`

 	`curl http://transactiondetailsapi.herokuapp.com/merchants/show/5`

 	`curl -i -X POST -H "Content-Type: application/json" -d '{"merchant_name":"Sandeep Flower", "domain":"flower"}' http://transactiondetailsapi.herokuapp.com/merchants/create`

 	`curl -i -X PUT -H "Content-Type: application/json" -d '{"merchant_name":"Sandeep", "domain":"Flower and Decoretor"}' http://transactiondetailsapi.herokuapp.com/merchants/update/2`


* **Transactiondetails.**

 	`curl http://transactiondetailsapi.herokuapp.com/transactiondetails`

 	`curl http://transactiondetailsapi.herokuapp.com/transactiondetails/show/1`

 	`curl -i -X POST -H "Content-Type: application/json" -d '{"sale_amount":"100", "consumer_id":"1", "merchant_id":"2"}' http://transactiondetailsapi.herokuapp.com/transactiondetails/create` 
 	
 	`curl -i -X PUT -H "Content-Type: application/json" -d '{"sale_amount":"500", "consumer_id":"2", "merchant_id":"2"}' http://transactiondetailsapi.herokuapp.com/transactiondetails/update/4`


# Docker 

* **Creating the docker Image**
	
	`docker build --rm -t transaction_api .`

* **Running the  docker image**

	`docker run --rm -p 5000:5000 transaction_api`	 	



