class CreateShippingsEvents < ActiveRecord::Migration
  def up
  	create_table 'shippings_events', :id => false do |t|
  		t.column :shipping_id, :integer
  		t.column :product_id, :integer
  	end	
  end

  def down
  end
end
