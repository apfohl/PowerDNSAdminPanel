ActiveAdmin.register Domain do
  permit_params :name, :type

  actions :all, except: [:edit, :update, :show]

  config.filters = false

  index do
    selectable_column
    column :name
    column :type
    column :notified_serial
    actions do |domain|
      link_to "Records", domain_records_path(domain)
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs :name, :type
    f.actions
  end
end
