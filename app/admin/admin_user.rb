ActiveAdmin.register AdminUser do
  # STRONG PARAMS
  permit_params :email, :password, :password_confirmation


  # CONFIG
  config.filters = false
  config.per_page = 10


  # ACTIONS
  actions :all, except: [:new, :edit, :show, :destroy]


  # INDEX
  index pagination_total: false do
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end


  # FORM
  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
