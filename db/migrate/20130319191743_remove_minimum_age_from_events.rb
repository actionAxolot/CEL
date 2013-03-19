class RemoveMinimumAgeFromEvents < ActiveRecord::Migration
  def up
  	remove_column :events, :minimum_age
  end

  def down
  	add_column :events, :minimum_age
  end
end
