ActiveAdmin.register Bill do
  # STRONG PARAMS
  permit_params :meal_id, :resident_id, :amount_decimal

  # CONFIG
  filter :reconciled, as: :select, collection: [false, true], include_blank: false, default: false
  config.per_page = 10
  config.sort_order = 'date'

  controller do
    def scoped_collection
      end_of_association_chain.includes(:meal, :resident, resident: :unit)
    end
  end

  # INDEX
  index do
    column Meal.model_name.human, :date, sortable: 'meals.date'
    column :reconciled
    column :resident, sortable: 'residents.name'
    column :unit, sortable: 'units.name'
    column '$', :amount_decimal, sortable: :amount_decimal do |bill|
      number_with_precision(bill.amount_decimal, precision: 2) unless bill.amount == 0
    end

    actions
  end

  # SHOW
  show do
    attributes_table do
      row :date
      row :resident
      row :unit
      row '$', :amount_decimal do |bill|
        number_with_precision(bill.amount_decimal, precision: 2) unless bill.amount == 0
      end
    end
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
