class ChangeShoppingLimitToInt < ActiveRecord::Migration
  def up
  	change_column :events, :shopping_limit, :integer, :default => 10
  end

  def down
  	change_column :events, :shopping_limit, :date
  end
end