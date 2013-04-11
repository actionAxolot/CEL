class AddProfilePictureToPastors < ActiveRecord::Migration
  def change
    change_table :pastors do |t|
      t.attachment :profile_pic
    end
  end
end
