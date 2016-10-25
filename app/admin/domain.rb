ActiveAdmin.register Domain do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :name, :type

  index do
    selectable_column
    column :name
    column :type
    actions
  end

  sidebar "Domain Details", only: [:show] do
    ul do
      li link_to "Resource Records", domain_records_path(domain)
    end
  end

end
