ActiveAdmin.register Meal do
  # STRONG PARAMS
  permit_params :date, guests_attributes: [:id, :name, :multiplier, :resident_id, :meal_id, :_destroy], resident_ids: []


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
    f.inputs do
      f.has_many :guests, allow_destroy: true, heading: 'Guests', new_record: true do |g|
        g.input :_destroy, as: :hidden
        g.input :name
        g.input :multiplier, label: 'Price Category', as: :select, include_blank: false, collection: [['Adult', 2], ['Child', 1]]
        g.input :resident, label: 'Host', collection: Resident.order('name')
        g.input :meal_id, as: :hidden, input_html: { value: meal.id }
      end
    end

    f.actions
    f.semantic_errors
  end
end
