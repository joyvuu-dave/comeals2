ActiveAdmin.register Meal do
  permit_params :date, :meal_resident_attributes, resident_ids: []

  # FORM
  form do |f|
    f.inputs do
      f.input :date
      f.input :residents
    end
    f.actions
    f.semantic_errors
  end
end
