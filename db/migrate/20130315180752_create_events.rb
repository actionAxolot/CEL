class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :short_description
      t.text :long_description
      t.string :location
      t.text :address
      t.string :city
      t.integer :zipcode
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :shopping_limit
      t.integer :max_amount_of_tickets

      t.timestamps
    end
    add_index :events, :user_id
  end
end
