class AddManyFieldToEvent < ActiveRecord::Migration
  def self.up
    rename_column :events, :address, :address_one
    add_column :events, :address_two, :string
    add_column :events, :state, :string
  end

  def self.down
    rename_column :events, :address_one, :address
    remove_column :events, :address_two
    remove_column :events, :state
  end
end
