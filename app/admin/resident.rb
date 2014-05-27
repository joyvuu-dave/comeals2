ActiveAdmin.register Resident do
  permit_params :name, :multiplier, :unit_id


  # FORM
  form do |f|
    f.inputs do
      f.input :name
      f.input :multiplier
      f.input :unit
    end
    f.actions
    f.semantic_errors
  end
end
