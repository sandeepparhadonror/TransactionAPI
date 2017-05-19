class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
  	create_table :merchants do |t|
  		t.string :merchant_name
  		t.string :domain
  		t.timestamps null: false
  	end
  end
end
