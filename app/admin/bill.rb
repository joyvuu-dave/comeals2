ActiveAdmin.register Bill do
  # STRONG PARAMS
  permit_params :meal_id, :resident_id, :amount_decimal


  # CONFIG
  config.filters = false
  config.per_page = 10


  # ACTIONS
  actions :all, except: [:show]


  # INDEX
  index pagination_total: false do
    column :meal do |bill|
      bill.meal.date
    end
    column :resident
    column :unit, sortable: false
    column '$', :amount_decimal, sortable: :amount_decimal do |bill|
      number_with_precision(bill.amount_decimal, precision: 2) unless bill.amount == 0
    end

    actions
  end


  # FORM
  form do |f|
    f.inputs do
      f.input :meal, label: 'Common Meal Date', collection: Meal.order('date').map { |i| [i.date, i.id] }
      f.input :resident, label: 'Cook', collection: Resident.adult.order('name')
      f.input :amount_decimal, label: '$'
    end

    f.actions
    f.semantic_errors
  end
end
