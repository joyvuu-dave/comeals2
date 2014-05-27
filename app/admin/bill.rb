ActiveAdmin.register Bill do
  permit_params :meal_id, :resident_id, :amount

  # FORM
  form do |f|
    f.inputs do
      f.input :meal
      f.input :resident
      f.input :amount
    end
    f.actions
    f.semantic_errors
  end
end
