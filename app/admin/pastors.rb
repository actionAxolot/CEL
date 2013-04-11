ActiveAdmin.register Pastor do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      row :name
    end
  end
end
