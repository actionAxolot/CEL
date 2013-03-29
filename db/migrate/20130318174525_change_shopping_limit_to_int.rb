class ChangeShoppingLimitToInt < ActiveRecord::Migration
  def change
    # TODO: REMEMBER THIS DROPS THE THING THERE
  	# change_column :events, :shopping_limit, :integer, :default => 10
    connection.execute(%q{
      ALTER TABLE events
      DROP COLUMN shopping_limit;
      ALTER TABLE events
      ADD COLUMN shopping_limit integer;
    })
  end
end
