class ChangeNameProductIDtoEventId < ActiveRecord::Migration
  def up
  	rename_column :shippings_events, :product_id, :event_id
  end

  def down
  	rename_column :shippings_events, :event_id, :product_id
  end
end
