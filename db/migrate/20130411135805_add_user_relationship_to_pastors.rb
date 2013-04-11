class AddUserRelationshipToPastors < ActiveRecord::Migration
  def change
    add_column :pastors, :user_id, :integer
  end
end
