class AddStartRegistrationAndEndRegistrationToEvents < ActiveRecord::Migration
  def up
  	add_column :events, :start_registration, :datetime
  	add_column :events, :end_registration, :datetime
  	remove_column :events, :begin_sale
  end
  def down
  	remove_column :events, :start_registration
  	remove_column :events, :end_registration
  	add_column :events, :begin_sale, :datetime
  end
end
