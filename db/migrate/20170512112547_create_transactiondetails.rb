class CreateTransactiondetails < ActiveRecord::Migration[5.1]
  def change
  	create_table :transaction_details do |t|
  		t.integer :sale_amount
  		t.datetime :sale_date
  		t.belongs_to :consumer, index: true
  		t.belongs_to :merchant, index: true
  		t.timestamps
  	end
  end
end
