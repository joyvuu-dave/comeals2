ActiveAdmin.register Unit do
  permit_params :name


  # FORM
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
    f.semantic_errors
  end
end
