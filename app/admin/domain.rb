ActiveAdmin.register Domain do
  permit_params :name, :master, :type

  actions :all, except: [:edit, :update, :show]

  config.filters = false

  index do
    selectable_column
    column :name
    column :master
    column :type
    column :notified_serial
    actions do |domain|
      link_to "Records", domain_records_path(domain)
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :master, hint: 'Insert only if type is SLAVE'
      f.input :type, as: :select, collection: Domain.types
    end
    f.actions
  end
end
