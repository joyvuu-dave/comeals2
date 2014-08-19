ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: "Ave. cost / adult $#{Meal.average_cost_per_adult}" do

    # Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel "Units - #{Unit.count(true)}" do
          ul do
            Unit.order('name').map do |unit|
              li link_to(unit.name, unit_path(unit))
            end
          end
        end
      end

      column do
        panel "Residents - #{Resident.count(true)}" do
          ul do
            Resident.order('name').map do |resident|
              li link_to(resident.name, resident_path(resident))
            end
          end
        end
      end

      column do
        panel "Meals - #{Meal.count(true)}" do
          ul do
            Meal.order('date').map do |meal|
              li link_to(meal.date, meal_path(meal))
            end
          end
        end
      end
    end
  end
end
