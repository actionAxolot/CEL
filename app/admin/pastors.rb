ActiveAdmin.register Pastor do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      row :user, :as => :select
      row :name
      row :email
      row :phone
      row :bio
      row :address_one
      row :address_two
      row :active
      row :profile_pic, :as => :file, :hint => f.template.image_tag(f.object.cover.url(:small))
    end
    f.buttons
  end
end
