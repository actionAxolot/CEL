class ChangeColumnAddressOneFromTextToString < ActiveRecord::Migration
  def self.up
    change_column :events, :address_one, :string
  end

  def self.down
    change_column :events, :address_one, :text
  end
end
