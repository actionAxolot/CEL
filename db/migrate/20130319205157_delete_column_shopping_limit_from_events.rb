class DeleteColumnShoppingLimitFromEvents < ActiveRecord::Migration
  def up
  	remove_column :events, :shopping_limit
  end

  def down
  	add_column :events, :shopping_limit, :integer
  end
end
