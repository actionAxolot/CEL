class AddColumnsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :custom_url, :string
    add_column :events, :video_url, :string
    add_column :events, :begin_sale, :datetime
    add_column :events, :website, :string
    add_column :events, :facebook_url, :string
    add_column :events, :twitter_id, :string
    add_column :events, :twitter_hashtag, :string
    add_column :events, :minimum_age, :integer
  end
end
