class TransactionDetail < ActiveRecord::Base

	belongs_to :consumer
	belongs_to :merchant

	validates :sale_amount, presence: true

	before_create :transation_sale_date

	def transation_sale_date
		self.sale_date = Time.now	
	end
  
end
