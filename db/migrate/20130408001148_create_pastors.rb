class CreatePastors < ActiveRecord::Migration
  def change
    create_table :pastors do |t|
      t.string :name
      t.text :bio
      t.string :phone
      t.string :email
      t.string :address_one
      t.string :address_two

      t.timestamps
    end
  end
end
