class AddActiveToPastors < ActiveRecord::Migration
  def change
    add_column :pastors, :is_active, :boolean, :default => false
  end
end
