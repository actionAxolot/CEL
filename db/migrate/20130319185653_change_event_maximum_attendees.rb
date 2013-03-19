class ChangeEventMaximumAttendees < ActiveRecord::Migration
  def up
  	rename_column :events, :max_amount_of_tickets, :max_num_attendees
  	add_column :events, :min_num_attendees, :integer
  end

  def down
  	rename_column :events, :max_num_attendees, :max_amount_of_tickets
  	remove_column :events, :min_num_attendees
  end
end
