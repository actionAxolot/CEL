class RemoveEventIdFromCategory < ActiveRecord::Migration
  def up
  	remove_column :categories, :event_id
  end

  def down
  	add_column :categories, :event_id, :integer
  end
end
