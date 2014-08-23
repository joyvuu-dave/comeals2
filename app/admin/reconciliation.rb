ActiveAdmin.register Reconciliation do
  # CONFIG
  config.filters = false
  config.per_page = 10

  form do |f|
    f.actions
    f.semantic_errors
  end
end
