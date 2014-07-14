ActiveAdmin.register Unit do
  # STRONG PARAMS
  permit_params :name

  # CONFIG
  config.filters = false
  config.per_page = 10
  config.sort_order = 'name_asc'

  # ACTIONS
  actions :all, except: [:show, :destroy]

  # INDEX
  index pagination_total: false do
    column 'Unit', :name
    column '$', :balance do |unit|
      number_with_precision((unit.balance.to_f / 100), precision: 2) unless unit.balance == 0
    end
    column '# of occupants', :number_of_occupants, sortable: false

    actions
  end

  # FORM
  form do |f|
    f.inputs do
      f.input :name
    end

    f.actions
    f.semantic_errors
  end
end
