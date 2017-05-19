require "sinatra"
require "transaction/web/main"
require "transaction/web/consumers"
require "transaction/web/merchants"
require "transaction/web/transaction_details"

module Transaction
  module Web
    def self.server
      map = {
        "/consumers" => Transaction::Web::Consumers,
        "/transactiondetails" => Transaction::Web::TransactionDetails,
        "/merchants" => Transaction::Web::Merchants
       }
      Rack::URLMap.new(map)
    end
  end
end
