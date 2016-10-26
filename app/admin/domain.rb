ActiveAdmin.register Domain do
  permit_params :name, :master, :type

  actions :all, except: [:show]

  config.filters = false

  index do
    selectable_column
    column :name
    column :master
    column :type
    column :notified_serial
    actions defaults: false do |domain|
      link_to('Records', domain_records_path(domain)) +
      ' ' +
      link_to('Edit', edit_domain_path(domain)) +
      ' ' +
      link_to('Delete', domain_path(domain), method: :delete, data: { confirm: 'Are you sure?' })
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      if f.object.new_record?
        f.input :name
      else
        f.input :name, input_html: { readonly: true }
      end
      f.input :master, hint: 'Insert only if type is SLAVE'
      f.input :type, as: :select, collection: Domain.types
    end
    f.actions
  end
end
