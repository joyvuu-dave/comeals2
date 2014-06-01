ActiveAdmin.register Resident do
  # STRONG PARAMS
  permit_params :name, :multiplier, :unit_id


  # CONFIG
  config.filters = false
  config.paginate = false
  config.sort_order = 'name_asc'


  # ACTIONS
  actions :all, except: [:show, :destroy]


  # INDEX
  index do
    column :name
    column 'Price Category', :multiplier do |resident|
      if resident.multiplier == 2
        "Adult"
      elsif resident.multiplier == 1
        "Child"
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
