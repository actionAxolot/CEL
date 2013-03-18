class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
    	t.references :event
    	t.string :name
    	t.string :short_description
    	
      t.timestamps
    end
  end
end
