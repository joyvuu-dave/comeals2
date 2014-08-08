ActiveAdmin.register Resident do
  # STRONG PARAMS
  permit_params :name, :multiplier, :unit_id

  # CONFIG
  config.filters = false
  config.per_page = 10
  config.sort_order = 'name_asc'

  # ACTIONS
  actions :all, except: [:destroy]

  # INDEX
  index pagination_total: false do
    column :name
    column 'Price Category', :multiplier, sortable: :multiplier do |resident|
      if resident.multiplier == 2
        'Adult'
      elsif resident.multiplier == 1
        'Child'
      else
        # Note: this would only be used if we allowed custom multiplier input
        "Adult x #{number_with_precision((resident.multiplier.to_f / 2), precision: 1, strip_insignificant_zeros: true)}"
      end
    end
    column :unit
    column '$', :balance do |resident|
      number_with_precision((resident.balance.to_f / 100), precision: 2) unless resident.balance == 0
    end

    actions
  end

  # SHOW
  show do
    attributes_table do
      table_for resident.meals.order('date') do
        column 'Meals Attended' do |meal|
          link_to meal.date, meal
        end
        column 'Cost Per Adult' do |meal|
          number_with_precision((meal.cost_per_adult.to_f / 100), precision: 2) unless meal.cost_per_adult == 0
        end
      end
      table_for resident.bills.all do
        column 'Bills' do |bill|
          link_to bill.meal.date, bill
        end
        column '$' do |bill|
          number_with_precision((bill.amount.to_f / 100), precision: 2) unless bill.amount == 0
        end
      end
    end
  end

  # FORM
  form do |f|
    f.inputs do
      f.input :name
      f.input :multiplier, label: 'Price Category', as: :radio, collection: [['Adult', 2], ['Child', 1]]
      f.input :unit, collection: Unit.order('name')
    end
    f.actions
    f.semantic_errors
  end
end
