class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :event

      t.timestamps
    end
    add_index :categories, :event_id
  end
end
