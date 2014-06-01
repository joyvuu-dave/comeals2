ActiveAdmin.register Bill do
  # STRONG PARAMS
  permit_params :meal_id, :resident_id, :amount_decimal


  # CONFIG
  config.filters = false
  config.paginate = false


  # ACTIONS
  actions :all, except: [:show]


  # INDEX
  index do
    column :meal do |bill|
      bill.meal.date
    end
    column :resident
    column '$', :amount_decimal do |bill|
      number_with_precision(bill.amount_decimal, precision: 2) unless bill.amount == 0
    end

    actions
  end


  # FORM
  form do |f|
    f.inputs do
      f.input :meal, label: 'Common Meal Date', collection: Meal.all.map { |i| [i.date, i.id] }
      f.input :resident, label: 'Cook', collection: Resident.order('name')
      f.input :amount_decimal, label: '$'
    end

    f.actions
    f.semantic_errors
  end
end
