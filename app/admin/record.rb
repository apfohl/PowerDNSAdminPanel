ActiveAdmin.register Record do
  permit_params :domain_id, :name, :type, :content, :ttl, :prio, :disabled

  belongs_to :domain

  config.sort_order = 'type_desc'

  actions :all, except: [:show]

  filter :type, as: :select
  filter :ttl
  filter :disabled

  index do
    selectable_column
    column :type do |domain|
      case domain.type
        when 'SOA'
          status_tag(domain.type, :blue)
        when 'NS'
          status_tag(domain.type, :green)
        when 'A'
          status_tag(domain.type, :red)
        when 'AAAA'
          status_tag(domain.type, :orange)
        else
          status_tag(domain.type)
      end
    end
    column :name
    column :content
    column :ttl
    column :prio
    column :disabled
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      if f.object.new_record?
        f.input :name
      else
        f.input :name, input_html: { readonly: true }
      end
      f.input :type, as: :select, collection: Record.types
      f.input :content
      f.input :ttl
      f.input :prio
      f.input :disabled
    end
    f.actions
  end
end
