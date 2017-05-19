class Consumer < ActiveRecord::Base

	has_many :transaction_details
	has_many :merchants, :through => :transaction_details

	validates :first_name, :last_name,  presence: true


end
