ActiveAdmin.register User do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :is_admin
    end
    f.buttons
  end
end
