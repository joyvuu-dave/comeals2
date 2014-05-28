ActiveAdmin.register Meal do
  # STRONG PARAMS
  permit_params :date, :meal_resident_attributes, resident_ids: []


  # CONFIG
  config.filters = false
  config.paginate = false


  # ACTIONS
  actions :all, except: [:show]


  # INDEX
  index do
    column :date
    column :number_of_diners
    column '$', :total_cost do |meal|
      number_with_precision((meal.total_cost.to_f / 100), precision: 2) unless meal.total_cost == 0
    end

    actions
  end


  # FORM
  form do |f|
    f.inputs do
      f.input :date, as: :datepicker
      f.input :residents, as: :check_boxes, label: 'Attendees', collection: Resident.order('name')
    end

    f.actions
    f.semantic_errors
  end
end
