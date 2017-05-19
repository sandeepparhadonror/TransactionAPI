class Merchant < ActiveRecord::Base

	has_many :transaction_details
	has_many :consumers,  :through => :transaction_details

	validates :merchant_name, :domain,  presence: true
	
end