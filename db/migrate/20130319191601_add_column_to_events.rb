class AddColumnToEvents < ActiveRecord::Migration
  def up
  	add_column :events, :age_group, :string
  end
  def down
  	remove_column :events, :age_group
  end
end
